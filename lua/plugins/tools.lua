-- Plugins that add specific functionality and editing tools.
return {
	-- FLASH.NVIM (Quick Navigation)
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
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle flash search",
			},
		},
	},

	-- NVIM-TS-AUTOTAG
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				per_filetype = {
					["html"] = { enable_close = false },
				},
			})
		end,
	},

	-- UNDOTREE
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
		},
	},

	-- ZEN-MODE
	{
		"folke/zen-mode.nvim",
		keys = {
			{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
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

	-- GRUG-FAR
	{
		"MagicDuck/grug-far.nvim",
		keys = {
			{ "<leader>sr", "<cmd>GrugFar<cr>", desc = "Search and replace (GrugFar)" },
			{
				"<leader>sw",
				function()
					require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
				end,
				desc = "Search current word (GrugFar)",
			},
		},
		opts = {},
	},

	-- KULALA.NVIM
	{
		"mistweaverco/kulala.nvim",
		ft = { "http", "rest" },
		keys = {
			{
				"<leader>Rr",
				function()
					require("kulala").run()
				end,
				desc = "Run request",
			},
			{
				"<leader>Rs",
				function()
					require("kulala").run_all()
				end,
				desc = "Run all requests",
			},
			{
				"<leader>Rp",
				function()
					require("kulala").jump_prev()
				end,
				desc = "Previous request",
			},
			{
				"<leader>Rn",
				function()
					require("kulala").jump_next()
				end,
				desc = "Next request",
			},
			{
				"<leader>Rc",
				function()
					require("kulala").copy()
				end,
				desc = "Copy as cURL",
			},
			{
				"<leader>Ri",
				function()
					require("kulala").inspect()
				end,
				desc = "Inspect request",
			},
		},
		opts = {
			default_view = "body",
			default_env = "dev",
			debug = false,
		},
	},

	-- Cloak Nvim
	{
		"laytan/cloak.nvim",
		config = function()
			require("cloak").setup({
				enabled = true,
				cloak_character = "*",
				-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
				highlight_group = "Comment",
				patterns = {
					{
						-- Match any file starting with ".env".
						-- This can be a table to match multiple file patterns.
						file_pattern = {
							".env*",
							"wrangler.toml",
							".dev.vars",
						},
						-- Match an equals sign and any character after it.
						-- This can also be a table of patterns to cloak,
						-- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
						cloak_pattern = "=.+",
					},
				},
			})
		end,
	},
}
