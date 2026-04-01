return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			config = function()
				require("copilot").setup({
					suggestion = { enabled = false },
					panel = { enabled = false },
					filetypes = {
						["*"] = true,
						markdown = true,
						help = false,
					},
				})
			end,
		},
		{ "giuxtaposition/blink-cmp-copilot" },
		{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "bydlw98/blink-cmp-env" },
		{ "garyhurtz/blink_cmp_kitty" },
		{ "bydlw98/blink-cmp-env" },
	},
	version = "1.*",

	opts = {
		keymap = {
			preset = "default",
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_next()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰏿",
			},
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = { border = "rounded" },
			},
			menu = {
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
								}
								return labels[ctx.source_name] or ("[" .. ctx.source_name .. "]")
							end,
						},

						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbol_map[ctx.kind] or ""
								end

								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
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
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			-- transform_items = function(_, items)
			--   for _, item in ipairs(items) do
			--     require("tailwindcss-colorizer-cmp").formatter(item, item)
			--   end
			--   return items
			-- end,
		},

		sources = {
			default = { "lazydev", "copilot", "lsp", "snippets", "path", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
				lsp = {
					score_offset = 80,
				},
				snippets = {
					score_offset = 70,
					opts = {
						extended_filetypes = {
							javascriptreact = { "html" },
							typescriptreact = { "html" },
							htmlangular = { "html" },
						},
					},
				},
				buffer = {
					score_offset = 40,
					min_keyword_length = 3,
				},
				path = {
					score_offset = 30,
				},
			},
		},
		cmdline = {
			enabled = true,
			keymap = { preset = "cmdline" },
			sources = { "buffer", "cmdline" },

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
					auto_show = function(ctx, _)
						return ctx.mode == "cmdwin"
					end,
				},
				ghost_text = { enabled = true },
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},

	opts_extend = { "sources.default" },
}
-- Nvim cmp with luasnip and friendly-snippets
-- return {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     {
--       "L3MON4D3/LuaSnip",
--       build = (function()
--         if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
--           return
--         end
--         return "make install_jsregexp"
--       end)(),
--       dependencies = {
--         {
--           "rafamadriz/friendly-snippets",
--           config = function()
--             require("luasnip.loaders.from_vscode").lazy_load()
--           end,
--         },
--       },
--     },
--     "hrsh7th/cmp-nvim-lua",
--     "hrsh7th/cmp-cmdline",
--     "hrsh7th/cmp-emoji",
--     "saadparwaiz1/cmp_luasnip",
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--     "SergioRibera/cmp-dotenv",
--     {
--       "zbirenbaum/copilot-cmp",
--       dependencies = {
--         {
--           "zbirenbaum/copilot.lua",
--           cmd = "Copilot",
--           event = "InsertEnter",
--           config = function()
--             require("copilot").setup({
--               suggestion = { enabled = false },
--               panel = { enabled = false },
--             })
--           end,
--         },
--         {
--           "rafamadriz/friendly-snippets",
--           config = function()
--             require("luasnip.loaders.from_vscode").lazy_load()
--           end,
--         },
--       },
--       config = function()
--         require("copilot_cmp").setup()
--       end,
--     },
--     { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
--     {
--       "folke/lazydev.nvim",
--       ft = "lua",
--       opts = {
--         library = {
--           { path = "luvit-meta/library", words = { "vim%.uv" } },
--         },
--       },
--     },
--   },
--
--   config = function()
--     local cmp = require("cmp")
--     local luasnip = require("luasnip")
--
--     local ok, custom_angular_snippets = pcall(require, "snippets.angular")
--     if ok and type(custom_angular_snippets) == "table" and not vim.tbl_isempty(custom_angular_snippets) then
--       luasnip.add_snippets("htmlangular", custom_angular_snippets)
--     end
--
--     luasnip.filetype_extend("javascriptreact", { "html" })
--     luasnip.filetype_extend("typescriptreact", { "html" })
--     luasnip.filetype_extend("htmlangular", { "html" })
--
--     luasnip.config.setup({
--       history = true,
--       updateevents = "InsertLeave",
--       enable_autosnippets = true,
--
--       ext_opts = {
--         [require("luasnip.util.types").choiceNode] = {
--           active = { virt_text = { { "●", "Orange" } } },
--         },
--       },
--     })
--
--     local kind_icons = {
--       Text = "󰉿",
--       Method = "󰆧",
--       Function = "󰊕",
--       Constructor = "",
--       Field = "󰜢",
--       Variable = "󰀫",
--       Class = "󰠱",
--       Interface = "",
--       Module = "",
--       Property = "󰜢",
--       Unit = "󰑭",
--       Value = "󰎠",
--       Enum = "",
--       Keyword = "󰌋",
--       Snippet = "",
--       Color = "󰏘",
--       File = "󰈙",
--       Reference = "󰈇",
--       Folder = "󰉋",
--       EnumMember = "",
--       Constant = "󰏿",
--       Struct = "󰙅",
--       Event = "",
--       Operator = "󰆕",
--       TypeParameter = "󰏿",
--       Copilot = "",
--     }
--
--     cmp.setup({
--       window = {
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--       },
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
--
--       mapping = cmp.mapping.preset.insert({
--         ["<C-n>"] = cmp.mapping.select_next_item(),
--         ["<C-p>"] = cmp.mapping.select_prev_item(),
--         ["<C-u>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-d>"] = cmp.mapping.scroll_docs(4),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         ["<C-Space>"] = cmp.mapping.complete({}),
--         ["<C-l>"] = cmp.mapping(function()
--           if luasnip.expand_or_locally_jumpable() then
--             luasnip.expand_or_jump()
--           end
--         end, { "i", "s" }),
--         ["<C-h>"] = cmp.mapping(function()
--           if luasnip.locally_jumpable(-1) then
--             luasnip.jump(-1)
--           end
--         end, { "i", "s" }),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           elseif luasnip.expand_or_locally_jumpable() then
--             luasnip.expand_or_jump()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif luasnip.locally_jumpable(-1) then
--             luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       }),
--
--       sources = cmp.config.sources({
--         { name = "lazydev",  group_index = 0 },
--         { name = "copilot",  priority = 1000 },
--         { name = "nvim_lsp", priority = 900 },
--         { name = "luasnip",  priority = 800 },
--         { name = "dotenv",   priority = 700, option = { path = ".", load_shell = false } },
--         { name = "buffer",   priority = 500, keyword_length = 3 },
--         { name = "path",     priority = 400 },
--       }),
--
--       formatting = {
--         fields = { "kind", "abbr", "menu" },
--         format = function(entry, vim_item)
--           vim_item.kind = string.format("%s", kind_icons[vim_item.kind] or "")
--
--           local detail = (entry.completion_item.labelDetails or {}).detail
--
--           vim_item.menu = ({
--             copilot = "[AI]",
--             nvim_lsp = "[LSP]",
--             luasnip = "[Snip]",
--             buffer = "[Buf]",
--             path = "[Path]",
--             dotenv = "[Env]",
--             lazydev = "[Dev]",
--           })[entry.source.name]
--           return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
--         end,
--       },
--
--       performance = {
--         debounce = 60,
--         throttle = 30,
--         fetching_timeout = 500,
--         max_view_entries = 20,
--         filtering_context_budget = 200,
--         confirm_resolve_timeout = 800,
--         async_budget = 100,
--       },
--     })
--
--     cmp.setup.cmdline("/", {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = {
--         { name = "buffer" },
--       },
--     })
--
--     cmp.setup.cmdline(":", {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = cmp.config.sources({
--         { name = "path" },
--       }, {
--         { name = "cmdline" },
--       }),
--       matching = {
--         disallow_symbol_nonprefix_matching = false,
--         disallow_fullfuzzy_matching = false,
--         disallow_partial_fuzzy_matching = false,
--         disallow_partial_matching = false,
--         disallow_prefix_unmatching = false,
--         disallow_fuzzy_matching = false,
--       },
--     })
--   end,
-- }
