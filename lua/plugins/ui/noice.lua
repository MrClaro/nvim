return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
			},

			messages = {
				enabled = true,
			},

			popupmenu = {
				enabled = true,
			},

			notify = {
				enabled = true,
			},

			lsp = {
				progress = {
					enabled = false,
				},
				hover = {
					enabled = true,
					silent = true,
				},
				signature = {
					enabled = true,
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = false,
				},
			},

			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},

			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = {
						skip = true,
					},
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = {
						skip = true,
					},
				},
			},
		},
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			render = "compact",
			stages = "fade",
			background_colour = "#000000",
		},
	},
}
