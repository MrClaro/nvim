return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = vim.fn.executable("make") == 1,
			},
		},

		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					prompt_prefix = "   ",
					selection_caret = "  ",
					path_display = { "truncate" },
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
					},
					file_ignore_patterns = {
						"node_modules",
						".git/",
						"dist/",
						"build/",
						"%.lock",
					},
				},

				pickers = {
					find_files = {
						hidden = true,
					},
				},
			})

			pcall(telescope.load_extension, "fzf")

			-- ===========================================================================
			-- Keymaps
			-- ===========================================================================

			-- Files
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Git files" })

			-- Text Search
			vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })

			-- LSP
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>fD", builtin.lsp_definitions, { desc = "LSP definitions" })
			vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "LSP implementations" })
			vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "LSP type definitions" })
			vim.keymap.set("n", "<leader>fs", function()
				builtin.lsp_document_symbols({
					symbols = { "Function", "Method" },
				})
			end, { desc = "Document symbols" })
			vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })

			-- Buffers
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Open buffers" })

			-- Misc
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
			vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
			vim.keymap.set("n", "<leader>f:", builtin.command_history, { desc = "Command history" })
		end,
	},
}
