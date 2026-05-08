local signs = {
	Error = " ",
	Warn = " ",
	Hint = "󰠠 ",
	Info = " ",
}

vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,

	float = {
		border = "rounded",
		source = true,
	},

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.HINT] = signs.Hint,
			[vim.diagnostic.severity.INFO] = signs.Info,
		},
	},
})

vim.keymap.set("n", "<leader>vv", function()
	local current = vim.diagnostic.config().virtual_text

	vim.diagnostic.config({
		virtual_text = not current,
	})
end, {
	desc = "Toggle diagnostic virtual text",
})

vim.keymap.set("n", "<leader>vi", function()
	if not vim.lsp.inlay_hint then
		return
	end

	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })

	vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })

	vim.notify("Inlay hints: " .. (not enabled and "enabled" or "disabled"))
end, {
	desc = "Toggle inlay hints",
})
