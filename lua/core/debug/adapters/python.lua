local M = {}

function M.setup()
	local dap = require("dap")
	local debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

	if vim.fn.executable(debugpy) ~= 1 then
		return
	end

	require("dap-python").setup(debugpy)

	table.insert(dap.configurations.python, {
		type = "python",
		request = "launch",
		name = "Debug pytest current file",
		module = "pytest",
		args = { "${file}" },
		console = "integratedTerminal",
	})

	table.insert(dap.configurations.python, {
		type = "python",
		request = "launch",
		name = "Debug current file",
		program = "${file}",
		console = "integratedTerminal",
	})
end

return M
