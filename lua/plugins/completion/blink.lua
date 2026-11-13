return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",

	dependencies = {
		"rafamadriz/friendly-snippets",
		"nvim-tree/nvim-web-devicons",
		"onsails/lspkind.nvim",

		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			opts = {
				suggestion = {
					enabled = true,
					auto_trigger = false,
					hide_during_completion = false,
					keymap = {
						accept = "<M-l>",
						accept_word = "<M-w>",
						accept_line = "<M-L>",
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = {
					enabled = false,
				},
				filetypes = {
					["*"] = true,
					markdown = true,
					help = false,
				},
			},
		},

		{
			"giuxtaposition/blink-cmp-copilot",
		},

		{
			"roobert/tailwindcss-colorizer-cmp.nvim",
			config = true,
		},

		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{
						path = "luvit-meta/library",
						words = { "vim%.uv" },
					},
				},
			},
		},

		{
			"bydlw98/blink-cmp-env",
		},
	},

	opts = {
		keymap = {
			preset = "none",

			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },

			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },

			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },

			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },

			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.accept()
					end

					if cmp.snippet_active({ direction = 1 }) then
						return cmp.snippet_forward()
					end
				end,
				"fallback",
			},

			["<S-Tab>"] = {
				function(cmp)
					if cmp.snippet_active({ direction = -1 }) then
						return cmp.snippet_backward()
					end

					if cmp.is_visible() then
						return cmp.select_prev()
					end
				end,
				"fallback",
			},

			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰏿",
			},
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 50,
				window = {
					border = "rounded",
				},
			},

			menu = {
				auto_show = true,
				border = "rounded",
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},

					components = {
						source_name = {
							text = function(ctx)
								local labels = {
									copilot = "[AI]",
									lsp = "[LSP]",
									snippets = "[Snip]",
									buffer = "[Buf]",
									path = "[Path]",
									lazydev = "[Dev]",
									env = "[Env]",
								}

								return labels[ctx.source_name] or ("[" .. ctx.source_name .. "]")
							end,
						},

						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon

								if ctx.source_name == "path" then
									local dev_icon = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									local ok, lspkind = pcall(require, "lspkind")
									if ok then
										icon = lspkind.symbol_map[ctx.kind] or icon
									end
								end

								return icon .. ctx.icon_gap
							end,

							highlight = function(ctx)
								local hl = ctx.kind_hl

								if ctx.source_name == "path" then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)

									if dev_icon then
										hl = dev_hl
									end
								end

								return hl
							end,
						},
					},
				},
			},

			accept = {
				auto_brackets = {
					enabled = true,
				},
			},

			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},

			ghost_text = {
				enabled = true,
			},
		},

		sources = {
			default = {
				"lazydev",
				"lsp",
				"snippets",
				"path",
				"buffer",
				"copilot",
				"env",
			},

			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},

				lsp = {
					score_offset = 90,
				},

				snippets = {
					score_offset = 80,
					opts = {
						extended_filetypes = {
							javascriptreact = { "html" },
							typescriptreact = { "html" },
							htmlangular = { "html" },
						},
					},
				},

				path = {
					score_offset = 60,
				},

				buffer = {
					score_offset = 40,
					min_keyword_length = 3,
				},

				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 20,
					async = true,
				},

				env = {
					name = "Env",
					module = "blink-cmp-env",
					score_offset = 50,
					opts = {
						item_kind = require("blink.cmp.types").CompletionItemKind.Variable,
						show_braces = false,
						show_documentation_window = true,
					},
				},
			},
		},

		cmdline = {
			enabled = true,
			keymap = {
				preset = "cmdline",
			},
			sources = {
				"buffer",
				"cmdline",
			},

			completion = {
				trigger = {
					show_on_blocked_trigger_characters = {},
					show_on_x_blocked_trigger_characters = {},
				},

				list = {
					selection = {
						auto_insert = true,
					},
				},

				menu = {
					auto_show = function(ctx)
						return ctx.mode == "cmdwin"
					end,
				},

				ghost_text = {
					enabled = true,
				},
			},
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	},

	opts_extend = {
		"sources.default",
	},
}
