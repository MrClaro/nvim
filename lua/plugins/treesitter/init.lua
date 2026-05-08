	-- ============================================================================
	-- Treesitter
	-- ============================================================================
local api = vim.api
local iter = vim.iter
local ts = vim.treesitter

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = {
			"BufReadPost",
			"BufNewFile",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			---@type string[]
			local ensure_langs = {
				"bash",
				"c",
				"cpp",
				"css",
				"dart",
				"diff",
				"dockerfile",
				"go",
				"gomod",
				"html",
				"http",
				"java",
				"javascript",
				"json",
				"kotlin",
				"lua",
				"luadoc",
				"make",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"rust",
				"scss",
				"sql",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"xml",
				"yaml",
			}

			local installed = require("nvim-treesitter").get_installed("parsers")

			local to_install = iter(ensure_langs)
				:filter(function(parser)
					return not vim.tbl_contains(installed, parser)
				end)
				:totable()

			if #to_install > 0 then
				require("nvim-treesitter").install(to_install)
			end

			local filetypes = iter(ensure_langs)
				:map(function(lang)
					return ts.language.get_filetypes(lang)
				end)
				:flatten(1)
				:totable()

			api.nvim_create_autocmd("FileType", {
				group = api.nvim_create_augroup("UserTreesitterStart", {
					clear = true,
				}),
				pattern = filetypes,
				callback = function(args)
					local ok = pcall(vim.treesitter.start, args.buf)

					if not ok then
						return
					end
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = {
			"BufReadPost",
			"BufNewFile",
		},
		opts = {
			enable = true,
			max_lines = 4,
			multiline_threshold = 1,
			min_window_height = 20,
			line_numbers = true,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
			on_attach = function(bufnr)
				local filetype = vim.bo[bufnr].filetype

				if vim.tbl_contains({
					"help",
					"lazy",
					"mason",
					"Trouble",
					"trouble",
					"dashboard",
					"alpha",
					"oil",
					"dapui_scopes",
					"dapui_breakpoints",
					"dapui_stacks",
					"dapui_watches",
					"dapui_console",
					"dap-repl",
					"Avante",
				}, filetype) then
					return false
				end

				return true
			end,
		},
		keys = {
			{
				"<leader>ut",
				function()
					require("treesitter-context").toggle()
				end,
				desc = "Toggle Treesitter context",
			},
		},
	},
}
