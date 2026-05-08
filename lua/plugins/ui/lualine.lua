local function lsp_name()
	local clients = vim.lsp.get_clients({
		bufnr = vim.api.nvim_get_current_buf(),
	})

	if #clients == 0 then
		return "No LSP"
	end

	local names = {}

	for _, client in ipairs(clients) do
		table.insert(names, client.name)
	end

	return table.concat(names, ", ")
end

local function dap_status()
	local ok, dap = pcall(require, "dap")

	if not ok then
		return ""
	end

	local status = dap.status()

	if status == "" then
		return ""
	end

	return "DAP: " .. status
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			theme = "auto",
			component_separators = {
				left = "",
				right = "",
			},
			section_separators = {
				left = "",
				right = "",
			},
			globalstatus = true,
		},
		sections = {
			lualine_a = {
				"mode",
			},
			lualine_b = {
				"branch",
				"diff",
				"diagnostics",
			},
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
			lualine_x = {
				dap_status,
				lsp_name,
				"encoding",
				"fileformat",
				"filetype",
			},
			lualine_y = {
				"progress",
			},
			lualine_z = {
				"location",
			},
		},
	},
}
