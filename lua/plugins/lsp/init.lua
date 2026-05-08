return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"b0o/schemastore.nvim",
			"ellisonleao/dotenv.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local servers = require("core.lsp.servers").get_servers()

			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name]

						if not server then
							return
						end

						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
}
