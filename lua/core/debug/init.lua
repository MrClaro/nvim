local M = {}

function M.setup()
	require("core.debug.mason").setup()
	require("core.debug.ui").setup()
	require("core.debug.signs").setup()

	require("core.debug.adapters.js").setup()
	require("core.debug.adapters.python").setup()
	require("core.debug.adapters.rust").setup()
	require("core.debug.adapters.go").setup()
	require("core.debug.adapters.lua").setup()
	require("core.debug.adapters.php").setup()
end

return M
