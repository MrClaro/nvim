return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"nvim-neotest/nvim-nio",
				},
			},

			"jay-babu/mason-nvim-dap.nvim",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
		},

		keys = require("core.debug.keymaps"),

		config = function()
			require("core.debug").setup()
		end,
	},
}
