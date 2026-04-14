return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "rust",
				callback = function(ev)
					local buf = ev.buf
					vim.keymap.set("n", "<leader>rd", function()
						vim.cmd.RustLsp("renderDiagnostic")
					end, { desc = "Render Error (Rust)", buffer = buf })
					vim.keymap.set("n", "<leader>rr", function()
						vim.cmd.RustLsp("runnables")
					end, { desc = "Rust Runnables", buffer = buf })
				end,
			})
			vim.g.rustaceanvim = {
				tools = {
					test_executor = "background",
					code_actions = {
						ui_select_fallback = true,
					},
					hover_actions = {
						auto_focus = true,
					},
				},
				server = {
					on_attach = function(client, bufnr)
						if vim.lsp.inlay_hint then
							vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
						end
					end,
					default_settings = {
						["rust-analyzer"] = {
							checkOnSave = true,
							check = {
								command = "clippy",
							},
							cargo = {
								allFeatures = true,
								loadOutDirsFromCheck = true,
								buildScripts = {
									enable = true,
								},
							},
							procMacro = {
								enable = true,
								ignored = {
									["async-trait"] = { "async_trait" },
									["napi-derive"] = { "napi" },
								},
							},
						},
					},
				},
			}
		end,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			completion = {
				crates = { enabled = true },
			},
		},
	},
}
