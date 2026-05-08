-- =============================================================================
-- AUTOCMDS
-- =============================================================================

local augroup = vim.api.nvim_create_augroup

-- =============================================================================
-- HIGHLIGHT YANK
-- =============================================================================

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("UserHighlightYank", { clear = true }),
	desc = "Highlight yanked text",
	callback = function()
		vim.hl.on_yank({ timeout = 200 })
	end,
})

-- =============================================================================
-- LAZYGIT
-- =============================================================================

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("UserLazyGit", { clear = true }),
	desc = "Configure LazyGit keymaps after startup",
	callback = function()
		pcall(vim.keymap.del, "n", "<leader>l")

		vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", {
			desc = "LazyGit",
		})
	end,
})

-- =============================================================================
-- Export keymaps to markdown
-- =============================================================================

vim.api.nvim_create_user_command("KeymapsExport", function()
	local modes = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		x = "VISUAL BLOCK",
		t = "TERMINAL",
	}

	local lines = {
		"# Neovim Keymaps",
		"",
		"| Mode | Key | Description | Command |",
		"|---|---|---|---|",
	}

	for mode, mode_name in pairs(modes) do
		local maps = vim.api.nvim_get_keymap(mode)

		for _, map in ipairs(maps) do
			local lhs = map.lhs or ""
			local desc = map.desc or ""
			local rhs = map.rhs or ""

			if desc ~= "" then
				rhs = rhs:gsub("\n", " "):gsub("|", "\\|")
				desc = desc:gsub("|", "\\|")
				lhs = lhs:gsub("|", "\\|")

				table.insert(lines, string.format("| %s | `%s` | %s | `%s` |", mode_name, lhs, desc, rhs))
			end
		end
	end

	local path = vim.fn.stdpath("config") .. "/KEYMAPS.md"
	vim.fn.writefile(lines, path)

	vim.notify("Keymaps exported to " .. path, vim.log.levels.INFO)
end, {
	desc = "Export keymaps to KEYMAPS.md",
})
