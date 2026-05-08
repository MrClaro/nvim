return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		ft = { "rust" },
		init = function()
			vim.g.rustaceanvim = {
				tools = {
					test_executor = "termopen",
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

						local map = vim.keymap.set
						local opts = { buffer = bufnr, silent = true }

						map("n", "<leader>Rr", function()
							vim.cmd.RustLsp("runnables")
						end, vim.tbl_extend("force", opts, { desc = "Rust Runnables" }))

						map("n", "<leader>Rt", function()
							vim.cmd.RustLsp("testables")
						end, vim.tbl_extend("force", opts, { desc = "Rust Testables" }))

						map("n", "<leader>Rd", function()
							vim.cmd.RustLsp("debuggables")
						end, vim.tbl_extend("force", opts, { desc = "Rust Debuggables" }))

						map("n", "<leader>Re", function()
							vim.cmd.RustLsp("explainError")
						end, vim.tbl_extend("force", opts, { desc = "Rust Explain Error" }))

						map("n", "<leader>Rm", function()
							vim.cmd.RustLsp("expandMacro")
						end, vim.tbl_extend("force", opts, { desc = "Rust Expand Macro" }))

						map("n", "<leader>RD", function()
							vim.cmd.RustLsp("renderDiagnostic")
						end, vim.tbl_extend("force", opts, { desc = "Rust Render Diagnostic" }))

						map("n", "<leader>Rc", function()
							vim.cmd.RustLsp("openCargo")
						end, vim.tbl_extend("force", opts, { desc = "Open Cargo.toml" }))
					end,
					default_settings = {
						["rust-analyzer"] = {
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
							diagnostics = {
								enable = true,
							},
							files = {
								excludeDirs = {
									".direnv",
									".git",
									".github",
									".gitlab",
									"node_modules",
									"target",
									"venv",
									".venv",
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
				crates = {
					enabled = true,
				},
			},
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		},
	},
}
