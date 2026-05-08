local M = {}

function M.setup()
	local dap = require("dap")
	local dapui = require("dapui")

	dapui.setup({
		icons = {
			expanded = "▾",
			collapsed = "▸",
			current_frame = "▶",
		},

		mappings = {
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},

		element_mappings = {},

		expand_lines = true,

		force_buffers = true,

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
		},

		windows = {
			indent = 1,
		},

		wrap = true,

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
			indent = 1,
			max_type_length = nil,
			max_value_lines = 100,
		},
	})

	dap.listeners.after.event_initialized["dapui"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui"] = function()
		dapui.close()
	end
end

return M
