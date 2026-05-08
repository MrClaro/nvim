return {
	-- ============================================================================
	-- LazyGit
	-- ============================================================================
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>lg",
				"<cmd>LazyGit<cr>",
				desc = "LazyGit",
			},
			{
				"<leader>lf",
				"<cmd>LazyGitFilter<cr>",
				desc = "LazyGit filter",
			},
			{
				"<leader>lF",
				"<cmd>LazyGitFilterCurrentFile<cr>",
				desc = "LazyGit filter current file",
			},
			{
				"<leader>lc",
				"<cmd>LazyGitConfig<cr>",
				desc = "LazyGit config",
			},
		},
	},

	-- ============================================================================
	-- Diffview
	-- ============================================================================
	{
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewFileHistory",
			"DiffviewFocusFiles",
			"DiffviewToggleFiles",
			"DiffviewRefresh",
		},
		keys = {
			{
				"<leader>gdo",
				"<cmd>DiffviewOpen<cr>",
				desc = "Git: Diffview open",
			},
			{
				"<leader>gdc",
				"<cmd>DiffviewClose<cr>",
				desc = "Git: Diffview close",
			},
			{
				"<leader>gdh",
				"<cmd>DiffviewFileHistory %<cr>",
				desc = "Git: File history",
			},
			{
				"<leader>gdH",
				"<cmd>DiffviewFileHistory<cr>",
				desc = "Git: Branch history",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- ============================================================================
	-- Advanced Git Search
	-- ============================================================================
	{
		"aaronhallaert/advanced-git-search.nvim",
		cmd = {
			"AdvancedGitSearch",
		},
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-fugitive",
			"tpope/vim-rhubarb",
		},
		keys = {
			{
				"<leader>ga",
				"<cmd>AdvancedGitSearch<cr>",
				desc = "Git: Advanced search",
			},
		},
		config = function()
			require("advanced_git_search").setup({
				telescope_theme = {
					function_name = "dropdown",
					show_builtin_git_pickers = false,
				},
			})
		end,
	},

	-- ============================================================================
	-- Gitsigns
	-- ============================================================================
	{
		"lewis6991/gitsigns.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			signs = {
				add = {
					text = "│",
				},
				change = {
					text = "│",
				},
				delete = {
					text = "_",
				},
				topdelete = {
					text = "‾",
				},
				changedelete = {
					text = "~",
				},
				untracked = {
					text = "┆",
				},
			},

			signs_staged = {
				add = {
					text = "┃",
				},
				change = {
					text = "┃",
				},
				delete = {
					text = "_",
				},
				topdelete = {
					text = "‾",
				},
				changedelete = {
					text = "~",
				},
				untracked = {
					text = "┆",
				},
			},

			current_line_blame = false,

			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 600,
				ignore_whitespace = false,
			},

			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = buffer,
						silent = true,
						desc = desc,
					})
				end

				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
						return
					end

					gs.nav_hunk("next")
				end, "Git: Next hunk")

				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
						return
					end

					gs.nav_hunk("prev")
				end, "Git: Previous hunk")

				map("n", "<leader>gb", gs.blame_line, "Git: Blame line")
				map("n", "<leader>gB", gs.toggle_current_line_blame, "Git: Toggle blame")
				map("n", "<leader>gd", gs.diffthis, "Git: Diff this")
				map("n", "<leader>gp", gs.preview_hunk, "Git: Preview hunk")
				map("n", "<leader>gr", gs.reset_hunk, "Git: Reset hunk")
				map("n", "<leader>gR", gs.reset_buffer, "Git: Reset buffer")
				map("n", "<leader>gs", gs.stage_hunk, "Git: Stage hunk")
				map("n", "<leader>gS", gs.stage_buffer, "Git: Stage buffer")
				map("n", "<leader>gu", gs.undo_stage_hunk, "Git: Undo stage hunk")

				map("v", "<leader>gs", function()
					gs.stage_hunk({
						vim.fn.line("."),
						vim.fn.line("v"),
					})
				end, "Git: Stage selected hunk")

				map("v", "<leader>gr", function()
					gs.reset_hunk({
						vim.fn.line("."),
						vim.fn.line("v"),
					})
				end, "Git: Reset selected hunk")
			end,
		},
	},
}
