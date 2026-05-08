return {
	"pmizio/typescript-tools.nvim",
	ft = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		settings = {
			spawn_without_cwd = true,
			composite_mode = "none",
			expose_as_code_action = "all",

			-- Do not attach Angular plugin here.
			-- angularls is already configured in lsp.lua.
			tsserver_plugins = {},

			tsserver_file_preferences = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
			},
		},
	},
}
