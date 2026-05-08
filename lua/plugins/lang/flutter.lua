return {
	"nvim-flutter/flutter-tools.nvim",
	ft = { "dart" },
	cmd = {
		"FlutterRun",
		"FlutterDevices",
		"FlutterEmulators",
		"FlutterReload",
		"FlutterRestart",
		"FlutterQuit",
		"FlutterDetach",
		"FlutterOutlineToggle",
		"FlutterDevTools",
		"FlutterCopyProfilerUrl",
		"FlutterLspRestart",
		"FlutterSuper",
		"FlutterReanalyze",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	opts = {
		ui = {
			border = "rounded",
			notification_style = "native",
		},

		decorations = {
			statusline = {
				app_version = true,
				device = true,
				project_config = true,
			},
		},

		debugger = {
			enabled = true,
			run_via_dap = true,
			exception_breakpoints = {},
		},

		dev_log = {
			enabled = true,
			open_cmd = "tabedit",
		},

		dev_tools = {
			autostart = false,
			auto_open_browser = false,
		},

		outline = {
			open_cmd = "30vnew",
			auto_open = false,
		},

		lsp = {
			color = {
				enabled = true,
				background = false,
				virtual_text = true,
				virtual_text_str = "■",
			},

			settings = {
				showTodos = true,
				completeFunctionCalls = true,
				analysisExcludedFolders = {
					vim.fn.expand("$HOME/.pub-cache"),
					vim.fn.expand("$HOME/fvm"),
				},
				renameFilesWithClasses = "prompt",
				enableSnippets = true,
				updateImportsOnRename = true,
			},
		},
	},

	keys = {
		{
			"<leader>Fr",
			"<cmd>FlutterRun<cr>",
			desc = "Flutter: Run",
		},
		{
			"<leader>Fq",
			"<cmd>FlutterQuit<cr>",
			desc = "Flutter: Quit",
		},
		{
			"<leader>FR",
			"<cmd>FlutterReload<cr>",
			desc = "Flutter: Hot reload",
		},
		{
			"<leader>FS",
			"<cmd>FlutterRestart<cr>",
			desc = "Flutter: Hot restart",
		},
		{
			"<leader>Fd",
			"<cmd>FlutterDevices<cr>",
			desc = "Flutter: Devices",
		},
		{
			"<leader>Fe",
			"<cmd>FlutterEmulators<cr>",
			desc = "Flutter: Emulators",
		},
		{
			"<leader>Fo",
			"<cmd>FlutterOutlineToggle<cr>",
			desc = "Flutter: Outline",
		},
		{
			"<leader>Fl",
			"<cmd>FlutterDevTools<cr>",
			desc = "Flutter: DevTools",
		},
		{
			"<leader>Fc",
			"<cmd>FlutterLogClear<cr>",
			desc = "Flutter: Clear log",
		},
	},
}
