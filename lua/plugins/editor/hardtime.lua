return {
	"m4xshen/hardtime.nvim",
	cmd = {
		"Hardtime",
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		disable_mouse = false,
		hint = true,
		notification = true,
		max_time = 1000,
		max_count = 5,

		disabled_filetypes = {
			"qf",
			"netrw",
			"NvimTree",
			"neo-tree",
			"lazy",
			"mason",
			"help",
			"Trouble",
			"trouble",
			"oil",
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"dapui_console",
			"dap-repl",
			"Avante",
			"harpoon",
		},
	},
	keys = {
		{
			"<leader>uH",
			"<cmd>Hardtime toggle<cr>",
			desc = "Toggle Hardtime",
		},
	},
}
