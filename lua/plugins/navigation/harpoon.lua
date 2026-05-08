return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		settings = {
			save_on_toggle = true,
			sync_on_ui_close = true,
		},
	},
	config = function(_, opts)
		local harpoon = require("harpoon")

		harpoon:setup(opts)

		local function nav(index)
			return function()
				harpoon:list():select(index)
			end
		end

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, {
			desc = "Harpoon: Add file",
		})

		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, {
			desc = "Harpoon: Toggle menu",
		})

		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, {
			desc = "Harpoon: Next file",
		})

		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, {
			desc = "Harpoon: Previous file",
		})

		vim.keymap.set("n", "<leader>1", nav(1), { desc = "Harpoon: File 1" })
		vim.keymap.set("n", "<leader>2", nav(2), { desc = "Harpoon: File 2" })
		vim.keymap.set("n", "<leader>3", nav(3), { desc = "Harpoon: File 3" })
		vim.keymap.set("n", "<leader>4", nav(4), { desc = "Harpoon: File 4" })
		vim.keymap.set("n", "<leader>5", nav(5), { desc = "Harpoon: File 5" })
	end,
}
