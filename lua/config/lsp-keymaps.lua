-- =============================================================================
-- LSP KEYMAPS
-- =============================================================================

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspKeymaps", {
		clear = true,
	}),
	desc = "Configure LSP keymaps",
	callback = function(event)
		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- Java / JDTLS inlay hints patch
		if client and client.name == "jdtls" then
			client.server_capabilities.inlayHintProvider = true

			vim.defer_fn(function()
				if vim.api.nvim_buf_is_valid(bufnr) and vim.lsp.inlay_hint then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end, 2500)
		end

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				buffer = bufnr,
				silent = true,
				desc = desc,
			})
		end

		pcall(vim.keymap.del, "n", "K", { buffer = bufnr })
		map("n", "K", "mzK`z", "Join lines up")

		map("n", "gd", vim.lsp.buf.definition, "Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

		map("n", "<A-k>", vim.lsp.buf.hover, "Hover docs")
		map("n", "<leader>k", vim.lsp.buf.signature_help, "Signature help")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")

		map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("v", "<leader>ca", vim.lsp.buf.code_action, "Code action")

		map("n", "<leader>dl", vim.diagnostic.open_float, "Diagnostic float")

		map("n", "<C-j>", function()
			vim.diagnostic.jump({
				count = 1,
				float = true,
			})
		end, "Next diagnostic")

		map("n", "<C-k>", function()
			vim.diagnostic.jump({
				count = -1,
				float = true,
			})
		end, "Previous diagnostic")

		map("n", "<leader>zig", "<cmd>LspRestart<cr>", "Restart LSP")
	end,
})
