local M = {}

function M.setup()
	local dap = require("dap")
	local adapter = vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js"

	if vim.fn.filereadable(adapter) ~= 1 then
		return
	end

	dap.adapters.php = {
		type = "executable",
		command = "node",
		args = {
			adapter,
		},
	}

	dap.configurations.php = {
		{
			type = "php",
			request = "launch",
			name = "Listen for XDebug",
			port = 9003,
			pathMappings = {
				["/var/www/html"] = "${workspaceFolder}",
			},
		},
	}
end

return M
