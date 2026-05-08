return {
	"lambdalisue/suda.vim",
	cmd = {
		"SudaRead",
		"SudaWrite",
	},
	init = function()
		vim.g["suda#prompt"] = "Senha: "

		if vim.fn.has("win32") == 0 then
			vim.g.suda_smart_edit = 0
		end
	end,
	keys = {
		{
			"<leader>uw",
			"<cmd>SudaWrite<cr>",
			desc = "Suda: Write as sudo",
		},
		{
			"<leader>ur",
			"<cmd>SudaRead<cr>",
			desc = "Suda: Read as sudo",
		},
	},
}
