return {
	"nvim-java/nvim-java",
	ft = { "java" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
	},
	config = function()
		vim.lsp.config("jdtls", {
			settings = {
				java = {
					inlayHints = {
						parameterNames = {
							enabled = "all",
							exclusions = {},
						},
					},
					signatureHelp = {
						enabled = true,
					},
				},
			},
		})

		require("java").setup({
			jdk = {
				auto_install = false,
			},
		})
	end,
}
