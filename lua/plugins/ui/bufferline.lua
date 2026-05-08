return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<Tab>",
			"<cmd>BufferLineCycleNext<cr>",
			desc = "Next buffer",
		},
		{
			"<S-Tab>",
			"<cmd>BufferLineCyclePrev<cr>",
			desc = "Previous buffer",
		},
	},
	opts = {
		options = {
			mode = "buffers",
			separator_style = "slant",
			show_buffer_close_icons = false,
			show_close_icon = false,
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			close_command = "bdelete! %d",
			right_mouse_command = "bdelete! %d",
			offsets = {
				{
					filetype = "oil",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
