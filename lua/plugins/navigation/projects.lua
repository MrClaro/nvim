return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		detection_methods = {
			"pattern",
			"lsp",
		},

		patterns = {
			".git",
			"Makefile",
			"package.json",
			"Cargo.toml",
			"go.mod",
			"pom.xml",
			"build.gradle",
			"settings.gradle",
			"pyproject.toml",
			"composer.json",
			"pubspec.yaml",
		},

		ignore_lsp = {},
		exclude_dirs = {
			"~/.cargo/*",
			"~/go/pkg/*",
			"~/node_modules/*",
		},

		show_hidden = true,
		silent_chdir = true,
		scope_chdir = "global",
	},
	config = function(_, opts)
		require("project_nvim").setup(opts)

		pcall(function()
			require("telescope").load_extension("projects")
		end)
	end,
	keys = {
		{
			"<leader>fp",
			"<cmd>Telescope projects<cr>",
			desc = "Find projects",
		},
	},
}
