return {
	"shellRaining/hlchunk.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	opts = {
		chunk = {
			enable = true,
			chars = {
				horizontal_line = "─",
				vertical_line = "│",
				left_top = "┌",
				left_bottom = "└",
				right_arrow = "─",
			},
			style = "#c21f30",
			duration = 80,
			delay = 50,
			exclude_filetypes = {
				"help",
				"lazy",
				"mason",
				"Trouble",
				"trouble",
				"oil",
				"dashboard",
				"alpha",
				"dapui_scopes",
				"dapui_breakpoints",
				"dapui_stacks",
				"dapui_watches",
				"dapui_console",
				"dap-repl",
				"Avante",
			},
		},

		indent = {
			enable = false,
		},

		line_num = {
			enable = false,
		},

		blank = {
			enable = false,
		},
	},
}
