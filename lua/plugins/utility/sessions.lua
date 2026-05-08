return {
	"olimorris/persisted.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>ss",
			"<cmd>SessionSave<cr>",
			desc = "Session save",
		},
		{
			"<leader>sl",
			"<cmd>SessionLoad<cr>",
			desc = "Session load",
		},
		{
			"<leader>sd",
			"<cmd>SessionDelete<cr>",
			desc = "Session delete",
		},
	},
	opts = {
		save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
		command = "VimLeavePre",
		use_git_branch = true,
		autosave = true,
		autoload = true,

		on_autoload_no_session = function()
			pcall(function()
				require("alpha").start(true)
			end)
		end,
	},
}
