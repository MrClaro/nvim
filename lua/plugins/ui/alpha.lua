return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local ascii_art = {
			"......................................-#%%%%@@@@@@@@@@@%%*=-:.......................................",
			".....................................+%%@@@@@@@@%%##%%%##%%%%%%%%#:.................................",
			"....................................*%@@@@@@%%%##%%@@@@@@@@@@@@@@@%:................................",
			"...................................#%%%@@%%%%%@@@@@@@@@@@@@@@@@@@@%#................................",
			"..................................-%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@%:...............................",
			"..................................#%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*...............................",
			".................................=%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%...............................",
			"................................=%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%+-.............................",
			".............................=%@#%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@@@@%*........................",
			".........................+@@@@@*%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*@@@@@@@@#:....................",
			"......................+%@@@@@@@+#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%**%%%@@@@@@%*...................",
			"....................*%@@@@@@@%%++***+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@##%#%@@@@@@@@%-..................",
			"...................#%@@@@@%%%%%++****+#####%%#*##%%%%#*%####%#*#*#+*%%%@@@@@@@@%#::.................",
			"..................:#%@@%%%%%%%*+*+**######***%%%%*#%%%%*%#%*%%%%%%@%%%@@@@@@@%%*--::................",
			"...................*%@@%%%%%%%%#=*+*###***#%%#*####%%###%%%%%%%#%@@@@@@@@@@%%#=---:.................",
			"....................=#%%%%%%%%@%@@%+=+*##%%*#=+%#%*%@@%%@@%%%%%@@@@@@@@%%%%#+=---:..................",
			".....................:+##%%%%%%%%@%%@@@@@%%#%##*+##+#%@@@@@@@@@@@@@%%%%%#++==--:....................",
			".......................:=*%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@%%%%@@@@@@%#*++==-::.......................",
			"...........................:=*%@@@%%%%%%%%%%%%%%@@@@@@@@@@@@@@%##*++==-::...........................",
			"................................::-=+*#%%@@@@@@@@@@@@%%###*++=--::..................................",
		}

		-- Header
		dashboard.section.header.val = ascii_art

		local colors = {
			"#7f0000",
			-- "#a30000",
			-- "#cc0000",
			-- "#ff0000",
			-- "#ff3333",
			-- "#ff6666",
		}

		local header_hl = {}
		for i = 1, #ascii_art do
			local group = "AlphaHeader" .. i
			vim.api.nvim_set_hl(0, group, { fg = colors[(i - 1) % #colors + 1] })

			table.insert(header_hl, { { group, 0, #ascii_art[i] } })
		end

		dashboard.section.header.opts = {
			position = "center",
			hl = header_hl,
		}

		-- Recents Options
		_G.recents_menu = function()
			vim.ui.select({
				"󰈞  Recent Files",
				"󰁯  Recent Projects",
			}, {
				prompt = "Recents",
			}, function(choice)
				if not choice then
					return
				end

				if choice:find("Files") then
					require("telescope.builtin").oldfiles()
				else
					require("telescope").extensions.projects.projects()
				end
			end)
		end
		dashboard.section.buttons.val = {
			dashboard.button("r", "󰄉  Recents", "<cmd>lua recents_menu()<CR>"),
			dashboard.button("b", "󰓩  Buffers", "<cmd>Telescope buffers<CR>"),
			dashboard.button("e", "󰉋  Explore", "<cmd>Oil<CR>"),
			dashboard.button("/", "󰍉  Ripgrep", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("o", "󰒓  Options", "<cmd>e $MYVIMRC<CR>"),
			dashboard.button("p", "󰏖  Plugins", "<cmd>Lazy<CR>"),
			dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
		}
		for _, btn in ipairs(dashboard.section.buttons.val) do
			btn.opts.hl = "AlphaButtons"
			btn.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.footer.val = "-O Dev De Chapéu-"
		dashboard.section.footer.opts = {
			hl = "AlphaFooter",
			position = "center",
		}
		dashboard.config.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}
		dashboard.config.opts.noautocmd = true
		alpha.setup(dashboard.config)

		-- Make sure Alpha is shown when opening Neovim without files
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc() == 0 then
					require("alpha").start(true)
				end
			end,
		})

		vim.api.nvim_create_autocmd({ "BufDelete", "BufEnter" }, {
			callback = function()
				vim.schedule(function()
					local buffers = vim.fn.getbufinfo({ buflisted = 1 })

					if #buffers == 1 then
						local buf = buffers[1]

						local is_empty = buf.name == ""
							and vim.bo[buf.bufnr].buftype == ""
							and not vim.bo[buf.bufnr].modified

						if is_empty then
							require("alpha").start(true)
						end
					end
				end)
			end,
		})
	end,
}
