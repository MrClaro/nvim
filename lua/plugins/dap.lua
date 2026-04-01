return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
			},
			"jay-babu/mason-nvim-dap.nvim",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- ===========================================================================
			-- Mason DAP
			-- ===========================================================================
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"js-debug-adapter",
					"python",
					"php",
				},
				automatic_installation = true,
				handlers = {},
			})

			-- ===========================================================================
			-- DAP UI
			-- ===========================================================================
			---@diagnostic disable-next-line: missing-fields
			dapui.setup({
				icons = { expanded = "", collapsed = "", current_frame = "" },
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.35 },
							{ id = "breakpoints", size = 0.15 },
							{ id = "stacks", size = 0.30 },
							{ id = "watches", size = 0.20 },
						},
						size = 45,
						position = "left",
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 12,
						position = "bottom",
					},
				},
				floating = {
					border = "rounded",
					mappings = {
						close = { "q", "<Esc>" },
					},
					max_height = nil,
					max_width = nil,
				},
				windows = { indent = 1 },
				controls = {
					enabled = true,
					element = "repl",
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
					},
				},
				render = {
					max_type_length = nil,
					indent = 1,
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "◆", texthl = "DiagnosticWarning", linehl = "", numhl = "" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "○", texthl = "DiagnosticError", linehl = "", numhl = "" }
			)
			vim.fn.sign_define("DapLogPoint", { text = "◎", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "▶", texthl = "DiagnosticOk", linehl = "DapStoppedLine", numhl = "" }
			)

			-- ===========================================================================
			-- TypeScript / JavaScript (vscode-js-debug)
			-- ===========================================================================

			---@diagnostic disable-next-line: missing-fields
			require("dap-vscode-js").setup({
				debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
				debugger_cmd = { "js-debug-adapter" },
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
				dap.configurations[language] = {
					-- Node (ts-node, tsx, etc)
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file (node)",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
					},
					-- Attach on Node (process running with --inspect)
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach to process",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
					-- Chrome (for React, Angular in the browser)
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch Chrome (Angular/React)",
						url = "http://localhost:4200",
						webRoot = "${workspaceFolder}",
						sourceMaps = true,
					},
					-- Jest
					{
						type = "pwa-node",
						request = "launch",
						name = "Debug Jest tests",
						runtimeExecutable = "node",
						runtimeArgs = { "./node_modules/jest/bin/jest.js", "--runInBand" },
						rootPath = "${workspaceFolder}",
						cwd = "${workspaceFolder}",
						console = "integratedTerminal",
						internalConsoleOptions = "neverOpen",
					},
				}
			end

			-- ===========================================================================
			-- Python (debugpy)
			-- ===========================================================================
			require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
			table.insert(dap.configurations.python, {
				type = "python",
				request = "launch",
				name = "Debug pytest",
				module = "pytest",
				args = { "${file}" },
				console = "integratedTerminal",
			})
			-- ===========================================================================
			-- Lua (nlua — use Neovim as runtime)
			-- ===========================================================================
			dap.adapters["nlua"] = function(callback, config)
				callback({
					type = "server",
					host = config.host or "127.0.0.1",
					port = config.port or 8086,
				})
			end
			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to Neovim (nlua)",
					host = "127.0.0.1",
					port = 8086,
				},
			}

			-- ===========================================================================
			-- PHP (xdebug)
			-- ===========================================================================
			dap.adapters.php = {
				type = "executable",
				command = "node",
				args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
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

			-- ===========================================================================
			-- Dart / Flutter
			-- ===========================================================================
			dap.adapters.dart = {
				type = "executable",
				command = "dart",
				args = { "debug_adapter" },
			}
			dap.adapters.flutter = {
				type = "executable",
				command = "flutter",
				args = { "debug_adapter" },
			}
			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Dart",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "flutter",
					request = "launch",
					name = "Launch Flutter",
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
					toolArgs = { "-d", "all" },
				},
			}

			-- ===========================================================================
			-- Keymaps
			-- ===========================================================================
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { desc = desc })
			end

			-- Execution control
			map("<leader>dc", dap.continue, "DAP: continue")
			map("<leader>dso", dap.step_over, "DAP: step over")
			map("<leader>dsi", dap.step_into, "DAP: step into")
			map("<leader>dsu", dap.step_out, "DAP: step out")
			map("<leader>db", dap.toggle_breakpoint, "DAP: toggle breakpoint")
			map("<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, "DAP: conditional breakpoint")
			map("<leader>dl", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log message: "))
			end, "DAP: log point")

			-- UI
			map("<leader>du", dapui.toggle, "DAP: toggle UI")
			map("<leader>de", dapui.eval, "DAP: eval expression")
			map("<leader>dr", dap.repl.open, "DAP: open REPL")
			map("<leader>dq", dap.terminate, "DAP: terminate")
			map("<leader>dC", dap.clear_breakpoints, "DAP: clear all breakpoints")

			-- Eval in visual mode (show the value of the selection)
			vim.keymap.set("v", "<leader>de", dapui.eval, { desc = "DAP: eval selection" })
		end,
	},
}
