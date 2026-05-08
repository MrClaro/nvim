return {
	"folke/todo-comments.nvim",
	event = {
		"BufReadPost",
		"BufNewFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {},
	keys = {
		{
			"<leader>td",
			"<cmd>TodoTrouble<cr>",
			desc = "Todo Trouble",
		},
		{
			"<leader>tf",
			"<cmd>TodoTelescope<cr>",
			desc = "Todo Telescope",
		},
	},
}
