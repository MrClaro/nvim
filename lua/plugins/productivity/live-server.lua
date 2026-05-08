return {
	"barrettruth/live-server.nvim",
	cmd = {
		"LiveServerStart",
		"LiveServerStop",
	},
	keys = {
		{
			"<leader>Ls",
			"<cmd>LiveServerStart<cr>",
			desc = "Live Server: Start",
		},
		{
			"<leader>Lq",
			"<cmd>LiveServerStop<cr>",
			desc = "Live Server: Stop",
		},
	},
	opts = {
		args = {
			"--browser=default",
			"--no-css-inject",
		},
	},
}
