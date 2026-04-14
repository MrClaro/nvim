return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		require("mason-null-ls").setup({
			ensure_installed = {
				"eslint_d",
				"checkmake",
				"prettierd",
			},
			automatic_installation = true,
		})

		null_ls.setup({
			sources = {
				formatting.prettierd.with({
					extra_args = { "--single-quote", "--jsx-single-quote" },
					-- Opcional: faz com que ele só rode se houver um arquivo de config (se preferir)
					-- condition = function(utils)
					--   return utils.root_has_file({ ".prettierrc", ".prettierrc.json", "package.json" })
					-- end,
				}),

				require("none-ls.diagnostics.eslint_d").with({
					condition = function(utils)
						return utils.root_has_file({
							".eslintrc",
							".eslintrc.js",
							".eslintrc.cjs",
							".eslintrc.json",
							"eslint.config.js",
							"eslint.config.mjs",
						})
					end,
				}),

				diagnostics.checkmake,
			},
		})
	end,
}
