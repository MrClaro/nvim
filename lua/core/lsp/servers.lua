local M = {}

function M.get_servers()
	return {
		angularls = {
			filetypes = {
				"typescript",
				"html",
				"typescriptreact",
				"htmlangular",
				"typescript.tsx",
			},
			on_attach = function(client)
				-- Angular rename can be noisy/buggy in mixed TS/HTML projects.
				client.server_capabilities.renameProvider = false
			end,
		},

		lua_ls = {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = {
							"vim",
						},
					},
					workspace = {
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		},

		jsonls = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = {
						enable = true,
					},
				},
			},
		},

		cssls = {},
		docker_compose_language_service = {},
		dockerls = {},
		html = {},
		kotlin_language_server = {},
		marksman = {},
		pyright = {},
		tailwindcss = {},
	}
end

return M
