local M = {}

function M.setup()
	local dap = require("dap")

	require("dap-vscode-js").setup({
		debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
		debugger_cmd = { "js-debug-adapter" },

		node_path = "node",

		log_file_path = vim.fn.stdpath("cache") .. "/dap-vscode-js.log",
		log_file_level = 0,
		log_console_level = 0,

		adapters = {
			"pwa-node",
			"pwa-chrome",
			"pwa-msedge",
			"node-terminal",
			"pwa-extensionHost",
		},
	})

	for _, language in ipairs({
		"typescript",
		"javascript",
		"typescriptreact",
		"javascriptreact",
	}) do
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				resolveSourceMapLocations = {
					"${workspaceFolder}/**",
					"!**/node_modules/**",
				},
				console = "integratedTerminal",
			},

			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to process",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
			},

			{
				type = "pwa-node",
				request = "launch",
				name = "Launch npm script",
				runtimeExecutable = "npm",
				runtimeArgs = function()
					local script = vim.fn.input("npm script: ", "dev")
					return { "run", script }
				end,
				cwd = "${workspaceFolder}",
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
			},

			{
				type = "pwa-chrome",
				request = "launch",
				name = "Launch Chrome",
				url = function()
					return vim.fn.input("URL: ", "http://localhost:3000")
				end,
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
			},

			{
				type = "pwa-node",
				request = "launch",
				name = "Debug Jest tests",
				runtimeExecutable = "node",
				runtimeArgs = {
					"./node_modules/jest/bin/jest.js",
					"--runInBand",
				},
				rootPath = "${workspaceFolder}",
				cwd = "${workspaceFolder}",
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
			},
		}
	end
end

return M
