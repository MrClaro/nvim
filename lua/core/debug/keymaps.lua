return {
	{
		"<leader>dc",
		function()
			require("dap").continue()
		end,
		desc = "DAP: Continue",
	},

	{
		"<leader>dso",
		function()
			require("dap").step_over()
		end,
		desc = "DAP: Step over",
	},

	{
		"<leader>dsi",
		function()
			require("dap").step_into()
		end,
		desc = "DAP: Step into",
	},

	{
		"<leader>dsu",
		function()
			require("dap").step_out()
		end,
		desc = "DAP: Step out",
	},

	{
		"<leader>db",
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "DAP: Toggle breakpoint",
	},

	{
		"<leader>dB",
		function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
		desc = "DAP: Conditional breakpoint",
	},

	{
		"<leader>dl",
		function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log message: "))
		end,
		desc = "DAP: Log point",
	},

	{
		"<leader>du",
		function()
			require("dapui").toggle()
		end,
		desc = "DAP: Toggle UI",
	},

	{
		"<leader>de",
		function()
			require("dapui").eval()
		end,
		desc = "DAP: Eval expression",
		mode = { "n", "v" },
	},

	{
		"<leader>dr",
		function()
			require("dap").repl.open()
		end,
		desc = "DAP: Open REPL",
	},

	{
		"<leader>dq",
		function()
			require("dap").terminate()
		end,
		desc = "DAP: Terminate",
	},

	{
		"<leader>dC",
		function()
			require("dap").clear_breakpoints()
		end,
		desc = "DAP: Clear all breakpoints",
	},
}
