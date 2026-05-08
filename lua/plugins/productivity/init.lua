return {
	-- ============================================================================
	-- Neogen
	-- ============================================================================
	{
		"danymat/neogen",
		cmd = {
			"Neogen",
		},
		keys = {
			{
				"<leader>cn",
				function()
					require("neogen").generate({})
				end,
				desc = "Generate docstring",
			},
		},
		opts = {
			snippet_engine = "luasnip",
		},
	},

	-- ============================================================================
	-- Mini Bracketed
	-- ============================================================================
	{
		"nvim-mini/mini.bracketed",
		event = "BufReadPost",
		opts = {
			file = {
				suffix = "",
			},
			window = {
				suffix = "",
			},
			quickfix = {
				suffix = "",
			},
			yank = {
				suffix = "",
			},
			treesitter = {
				suffix = "n",
			},
			diagnostic = {
				suffix = "d",
			},
			buffer = {
				suffix = "b",
			},
			comment = {
				suffix = "c",
			},
		},
	},

	-- ============================================================================
	-- Dial
	-- ============================================================================
	{
		"monaqa/dial.nvim",
		keys = {
			{
				"<C-a>",
				function()
					return require("dial.map").inc_normal()
				end,
				expr = true,
				desc = "Increment",
			},
			{
				"<C-x>",
				function()
					return require("dial.map").dec_normal()
				end,
				expr = true,
				desc = "Decrement",
			},
			{
				"g<C-a>",
				function()
					return require("dial.map").inc_gnormal()
				end,
				expr = true,
				desc = "Increment sequence",
			},
			{
				"g<C-x>",
				function()
					return require("dial.map").dec_gnormal()
				end,
				expr = true,
				desc = "Decrement sequence",
			},
		},
		config = function()
			local augend = require("dial.augend")

			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.date.alias["%d/%m/%Y"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({
						elements = {
							"let",
							"const",
						},
					}),
					augend.constant.new({
						elements = {
							"true",
							"false",
						},
					}),
					augend.constant.new({
						elements = {
							"Some",
							"None",
						},
					}),
					augend.constant.new({
						elements = {
							"Ok",
							"Err",
						},
					}),
				},
			})
		end,
	},

	-- ============================================================================
	-- Symbols Outline
	-- ============================================================================
	{
		"simrat39/symbols-outline.nvim",
		cmd = {
			"SymbolsOutline",
		},
		keys = {
			{
				"<leader>cs",
				"<cmd>SymbolsOutline<cr>",
				desc = "Symbols outline",
			},
		},
		opts = {
			position = "right",
			width = 35,
			auto_close = false,
			show_numbers = false,
			show_relative_numbers = false,
			wrap = false,
		},
	},

	-- ============================================================================
	-- Refactoring
	-- ============================================================================
	{
		"ThePrimeagen/refactoring.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"<leader>re",
				function()
					require("refactoring").refactor("Extract Function")
				end,
				mode = "v",
				desc = "Extract function",
			},
			{
				"<leader>rf",
				function()
					require("refactoring").refactor("Extract Function To File")
				end,
				mode = "v",
				desc = "Extract function to file",
			},
			{
				"<leader>rv",
				function()
					require("refactoring").refactor("Extract Variable")
				end,
				mode = "v",
				desc = "Extract variable",
			},
			{
				"<leader>ri",
				function()
					require("refactoring").refactor("Inline Variable")
				end,
				mode = { "n", "v" },
				desc = "Inline variable",
			},
			{
				"<leader>rI",
				function()
					require("refactoring").refactor("Inline Function")
				end,
				mode = "n",
				desc = "Inline function",
			},
			{
				"<leader>rb",
				function()
					require("refactoring").refactor("Extract Block")
				end,
				mode = "n",
				desc = "Extract block",
			},
			{
				"<leader>rB",
				function()
					require("refactoring").refactor("Extract Block To File")
				end,
				mode = "n",
				desc = "Extract block to file",
			},
		},
		opts = {},
	},
}
