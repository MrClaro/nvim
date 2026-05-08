local M = {}

function M.setup()
	pcall(function()
		require("dap-go").setup({
			dap_configurations = {
				{
					type = "go",
					name = "Debug package",
					request = "launch",
					program = "${workspaceFolder}",
				},
			},
		})
	end)
end

return M
