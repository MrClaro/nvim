return {
	"nickjvandyke/opencode.nvim",
	version = "*",
	cmd = {
		"Opencode",
	},
	dependencies = {
		{
			"folke/snacks.nvim",
			optional = true,
			opts = {
				input = {},
				picker = {
					actions = {
						opencode_send = function(...)
							return require("opencode").snacks_picker_send(...)
						end,
					},
					win = {
						input = {
							keys = {
								["<a-a>"] = {
									"opencode_send",
									mode = { "n", "i" },
								},
							},
						},
					},
				},
			},
		},
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {}

		vim.o.autoread = true

		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ", {
				submit = true,
			})
		end, {
			desc = "OpenCode: Ask about this",
		})

		vim.keymap.set({ "n", "x" }, "<leader>oA", function()
			require("opencode").ask()
		end, {
			desc = "OpenCode: Ask",
		})

		vim.keymap.set({ "n", "x" }, "<leader>os", function()
			require("opencode").select()
		end, {
			desc = "OpenCode: Select action",
		})

		vim.keymap.set({ "n", "t" }, "<leader>ot", function()
			require("opencode").toggle()
		end, {
			desc = "OpenCode: Toggle",
		})

		vim.keymap.set({ "n", "x" }, "<leader>oo", function()
			return require("opencode").operator("@this ")
		end, {
			desc = "OpenCode: Add range",
			expr = true,
		})

		vim.keymap.set("n", "<leader>ol", function()
			return require("opencode").operator("@this ") .. "_"
		end, {
			desc = "OpenCode: Add line",
			expr = true,
		})

		vim.keymap.set("n", "<leader>ou", function()
			require("opencode").command("session.half.page.up")
		end, {
			desc = "OpenCode: Scroll up",
		})

		vim.keymap.set("n", "<leader>od", function()
			require("opencode").command("session.half.page.down")
		end, {
			desc = "OpenCode: Scroll down",
		})
	end,
}
