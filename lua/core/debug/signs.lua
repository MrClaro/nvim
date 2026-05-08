local M = {}

function M.setup()
	vim.fn.sign_define("DapBreakpoint", {
		text = "●",
		texthl = "DiagnosticError",
	})

	vim.fn.sign_define("DapBreakpointCondition", {
		text = "◆",
		texthl = "DiagnosticWarn",
	})

	vim.fn.sign_define("DapBreakpointRejected", {
		text = "○",
		texthl = "DiagnosticError",
	})

	vim.fn.sign_define("DapLogPoint", {
		text = "◎",
		texthl = "DiagnosticInfo",
	})

	vim.fn.sign_define("DapStopped", {
		text = "▶",
		texthl = "DiagnosticOk",
		linehl = "DapStoppedLine",
	})
end

return M
