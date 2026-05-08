return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = {
		"Oil",
	},
	keys = {
		{
			"<leader>e",
			"<cmd>Oil<cr>",
			desc = "Oil: Open parent directory",
		},
		{
			"<leader>E",
			function()
				require("oil").open(vim.fn.getcwd())
			end,
			desc = "Oil: Open cwd",
		},
	},
	opts = {
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,

		columns = {
			"icon",
			"permissions",
			"size",
			"mtime",
		},

		float = {
			padding = 2,
			max_width = 0.9,
			max_height = 0.9,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
		},

		view_options = {
			show_hidden = true,
			is_always_hidden = function(name)
				return name == "node_modules" or name == ".git"
			end,
		},

		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["l"] = "actions.select",
			["<C-s>"] = "actions.select_split",
			["<C-v>"] = "actions.select_vsplit",
			["<C-t>"] = "actions.select_tab",
			["h"] = "actions.parent",
			["-"] = "actions.parent",
			["."] = "actions.toggle_hidden",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["q"] = "actions.close",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
		},
	},
}
