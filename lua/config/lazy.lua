local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins.ai" },
		{ import = "plugins.colors" },
		{ import = "plugins.completion" },
		{ import = "plugins.debug" },
		{ import = "plugins.editor" },
		{ import = "plugins.git" },
		{ import = "plugins.lang" },
		{ import = "plugins.lsp" },
		{ import = "plugins.navigation" },
		{ import = "plugins.productivity" },
		{ import = "plugins.search" },
		{ import = "plugins.tools" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.ui" },
		{ import = "plugins.utility" },
	},

	change_detection = {
		notify = false,
	},

	checker = {
		enabled = false,
	},
})
