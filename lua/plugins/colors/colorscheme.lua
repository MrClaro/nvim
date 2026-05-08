return {
	"jesseleite/nvim-noirbuddy",
	priority = 1000,
	dependencies = {
		"tjdevries/colorbuddy.nvim",
	},
	config = function()
		require("noirbuddy").setup({
			preset = "minimal",
			colors = {
				primary = "#ff0000",
			},
		})

		require("config.highlights").setup()

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("UserThemeHighlights", { clear = true }),
			callback = function()
				require("config.highlights").setup()
			end,
		})
	end,
}
