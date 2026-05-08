return {
	-- ============================================================================
	-- MDX
	-- ============================================================================
	{
		"davidmh/mdx.nvim",
		ft = {
			"mdx",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = true,
	},

	{
		"jxnblk/vim-mdx-js",
		ft = {
			"mdx",
		},
	},

	-- ============================================================================
	-- Render Markdown
	-- ============================================================================
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = {
			"markdown",
			"mdx",
			"Avante",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			file_types = {
				"markdown",
				"mdx",
				"Avante",
			},

			heading = {
				enabled = true,
				icons = {
					"󰲡 ",
					"󰲣 ",
					"󰲥 ",
					"󰲧 ",
					"󰲩 ",
					"󰲫 ",
				},
			},

			code = {
				enabled = true,
				style = "full",
				border = "thin",
			},

			bullet = {
				enabled = true,
			},

			latex = {
				enabled = false,
			},

			checkbox = {
				enabled = true,
				unchecked = {
					icon = "󰄱 ",
				},
				checked = {
					icon = "󰱒 ",
				},
			},
		},
	},

	-- ============================================================================
	-- Markdown Preview
	-- ============================================================================
	{
		"iamcco/markdown-preview.nvim",
		ft = {
			"markdown",
			"mdx",
		},
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		keys = {
			{
				"<leader>mp",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown: Preview",
			},
		},
		init = function()
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_command_for_global = 0
			vim.g.mkdp_open_to_the_world = 0
			vim.g.mkdp_browser = ""
		end,
	},
}
