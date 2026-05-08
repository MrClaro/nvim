local M = {}

function M.setup()
	require("mason-nvim-dap").setup({
		ensure_installed = {
			"js-debug-adapter",
			"debugpy",
			"php-debug-adapter",
			"codelldb",
		},
		automatic_installation = true,
		handlers = {},
	})
end

return M
