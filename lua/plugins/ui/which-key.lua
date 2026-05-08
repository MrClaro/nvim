return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 300,
		win = {
			border = "rounded",
		},
		layout = {
			height = {
				min = 4,
				max = 25,
			},
			width = {
				min = 20,
				max = 50,
			},
			align = "right",
		},
		spec = {
			{ "<leader>a", group = "AI / Avante" },
			{ "<leader>b", group = "Buffers" },
			{ "<leader>c", group = "Code" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>H", group = "HTTP" },
			{ "<leader>l", group = "LazyGit" },
			{ "<leader>o", group = "OpenCode" },
			{ "<leader>r", group = "Refactor" },
			{ "<leader>R", group = "Rust" },
			{ "<leader>s", group = "Search / Session" },
			{ "<leader>t", group = "Trouble / Todo" },
			{ "<leader>u", group = "UI / Utils" },
			{ "<leader>v", group = "View / Virtual text" },
		},
	},
}
