return {
	-- ============================================================================
	-- Flash
	-- ============================================================================
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"zk",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash jump",
			},
			{
				"Zk",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash treesitter",
			},
			{
				"Zr",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote flash",
			},
			{
				"ZR",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter search",
			},
			{
				"<C-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle flash search",
			},
		},
	},

	-- ============================================================================
	-- Autotag
	-- ============================================================================
	{
		"windwp/nvim-ts-autotag",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
			per_filetype = {
				html = {
					enable_close = false,
				},
				rust = {
					enable_close = false,
					enable_rename = false,
				},
			},
		},
	},

	-- ============================================================================
	-- Undotree
	-- ============================================================================
	{
		"mbbill/undotree",
		cmd = {
			"UndotreeToggle",
		},
		keys = {
			{
				"<leader>u",
				"<cmd>UndotreeToggle<cr>",
				desc = "Toggle Undotree",
			},
		},
	},

	-- ============================================================================
	-- Zen Mode
	-- ============================================================================
	{
		"folke/zen-mode.nvim",
		cmd = {
			"ZenMode",
		},
		keys = {
			{
				"<leader>z",
				"<cmd>ZenMode<cr>",
				desc = "Toggle Zen Mode",
			},
		},
		opts = {
			window = {
				width = 0.85,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
				},
			},
		},
	},

	-- ============================================================================
	-- Grug Far
	-- ============================================================================
	{
		"MagicDuck/grug-far.nvim",
		cmd = {
			"GrugFar",
		},
		keys = {
			{
				"<leader>sr",
				"<cmd>GrugFar<cr>",
				desc = "Search and replace",
			},
			{
				"<leader>sw",
				function()
					require("grug-far").open({
						prefills = {
							search = vim.fn.expand("<cword>"),
						},
					})
				end,
				desc = "Search current word",
			},
		},
		opts = {},
	},

	-- ============================================================================
	-- Kulala
	-- ============================================================================
	{
		"mistweaverco/kulala.nvim",
		ft = {
			"http",
			"rest",
		},
		keys = {
			{
				"<leader>Hr",
				function()
					require("kulala").run()
				end,
				desc = "HTTP: Run request",
			},
			{
				"<leader>Ha",
				function()
					require("kulala").run_all()
				end,
				desc = "HTTP: Run all requests",
			},
			{
				"<leader>Hp",
				function()
					require("kulala").jump_prev()
				end,
				desc = "HTTP: Previous request",
			},
			{
				"<leader>Hn",
				function()
					require("kulala").jump_next()
				end,
				desc = "HTTP: Next request",
			},
			{
				"<leader>Hc",
				function()
					require("kulala").copy()
				end,
				desc = "HTTP: Copy as cURL",
			},
			{
				"<leader>Hi",
				function()
					require("kulala").inspect()
				end,
				desc = "HTTP: Inspect request",
			},
		},
		opts = {
			default_view = "body",
			default_env = "dev",
			debug = false,
		},
	},

	-- ============================================================================
	-- Cloak
	-- ============================================================================
	{
		"laytan/cloak.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			enabled = true,
			cloak_character = "*",
			highlight_group = "Comment",
			patterns = {
				{
					file_pattern = {
						".env*",
						"wrangler.toml",
						".dev.vars",
					},
					cloak_pattern = "=.+",
				},
			},
		},
	},
}
