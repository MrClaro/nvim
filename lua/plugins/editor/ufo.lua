return {
	"kevinhwang91/nvim-ufo",
	event = {
		"BufReadPost",
		"BufNewFile",
	},
	dependencies = {
		"kevinhwang91/promise-async",
	},
	init = function()
		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	opts = {
		open_fold_hl_timeout = 150,
		close_fold_kinds_for_ft = {
			default = {
				"imports",
				"comment",
			},
			rust = {
				"comment",
				"imports",
			},
		},
		provider_selector = function(_, filetype, buftype)
			if buftype ~= "" then
				return ""
			end

			if
				vim.tbl_contains({
					"help",
					"lazy",
					"mason",
					"Trouble",
					"trouble",
					"oil",
					"dapui_scopes",
					"dapui_breakpoints",
					"dapui_stacks",
					"dapui_watches",
					"dapui_console",
					"dap-repl",
					"Avante",
				}, filetype)
			then
				return ""
			end

			return { "lsp", "indent" }
		end,
	},
	keys = {
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
			desc = "Open all folds",
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
			desc = "Close all folds",
		},
	},
}
