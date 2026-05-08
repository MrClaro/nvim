return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = {
			"Telescope",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = vim.fn.executable("make") == 1,
			},
		},

		keys = {
			{
				"<leader><leader>",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fr",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Recent files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Git files",
			},
			{
				"<leader>/",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Grep word under cursor",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Open buffers",
			},
			{
				"<leader>fd",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>fD",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "LSP definitions",
			},
			{
				"<leader>fi",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "LSP implementations",
			},
			{
				"<leader>ft",
				function()
					require("telescope.builtin").lsp_type_definitions()
				end,
				desc = "LSP type definitions",
			},
			{
				"<leader>fs",
				function()
					require("telescope.builtin").lsp_document_symbols({
						symbols = {
							"Function",
							"Method",
							"Struct",
							"Enum",
							"Trait",
							"Class",
							"Interface",
						},
					})
				end,
				desc = "Document symbols",
			},
			{
				"<leader>fS",
				function()
					require("telescope.builtin").lsp_workspace_symbols()
				end,
				desc = "Workspace symbols",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help tags",
			},
			{
				"<leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>fc",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>f:",
				function()
					require("telescope.builtin").command_history()
				end,
				desc = "Command history",
			},
		},

		opts = function()
			local actions = require("telescope.actions")

			return {
				defaults = {
					prompt_prefix = "  ",
					selection_caret = "  ",
					path_display = {
						"truncate",
					},
					sorting_strategy = "ascending",

					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
					},

					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<Esc>"] = actions.close,
						},
						n = {
							["q"] = actions.close,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},

					file_ignore_patterns = {
						"node_modules/",
						".git/",
						"dist/",
						"build/",
						"target/",
						".next/",
						"coverage/",
						"%.lock",
					},

					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob",
						"!**/.git/*",
						"--glob",
						"!**/node_modules/*",
						"--glob",
						"!**/target/*",
						"--glob",
						"!**/dist/*",
						"--glob",
						"!**/build/*",
					},
				},

				pickers = {
					find_files = {
						hidden = true,
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob",
							"!**/.git/*",
							"--glob",
							"!**/node_modules/*",
							"--glob",
							"!**/target/*",
							"--glob",
							"!**/dist/*",
							"--glob",
							"!**/build/*",
						},
					},
				},
			}
		end,

		config = function(_, opts)
			local telescope = require("telescope")

			telescope.setup(opts)

			pcall(telescope.load_extension, "fzf")
		end,
	},
}
