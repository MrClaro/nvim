local M = {}

local function get_codelldb()
	local mason_codelldb = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"

	if vim.fn.executable(mason_codelldb) == 1 then
		return mason_codelldb
	end

	if vim.fn.executable("codelldb") == 1 then
		return "codelldb"
	end

	return mason_codelldb
end

local function pick_rust_binary()
	local cwd = vim.fn.getcwd()
	local target_debug = cwd .. "/target/debug"

	if vim.fn.isdirectory(target_debug) == 1 then
		return vim.fn.input("Binary: ", target_debug .. "/", "file")
	end

	return vim.fn.input("Binary: ", cwd .. "/", "file")
end

function M.setup()
	local dap = require("dap")
	local codelldb = get_codelldb()

	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = codelldb,
			args = { "--port", "${port}" },
		},
	}

	dap.configurations.rust = {
		{
			name = "Launch binary",
			type = "codelldb",
			request = "launch",
			program = pick_rust_binary,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},

		{
			name = "Launch current file binary",
			type = "codelldb",
			request = "launch",
			program = function()
				local file = vim.fn.expand("%:t:r")
				return vim.fn.getcwd() .. "/target/debug/" .. file
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}

	dap.configurations.c = dap.configurations.rust
	dap.configurations.cpp = dap.configurations.rust
end

return M
