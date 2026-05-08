local M = {}

local palette = {
	bg = "#000000",
	bg_alt = "#080808",
	bg_soft = "#111111",
	bg_visual = "#3a3a3a",
	bg_selection = "#262626",

	fg = "#ffffff",
	fg_soft = "#d7d7d7",
	fg_muted = "#a8a8a8",
	comment = "#666666",

	red = "#ff0000",
	red_soft = "#ff5555",
	red_dim = "#cc3333",
	red_pale = "#ff7777",
	red_light = "#ff9999",

	orange = "#ffb86c",
	yellow = "#f1fa8c",
	green = "#50fa7b",
	green_soft = "#aee086",
	cyan = "#8be9fd",
	blue = "#82aaff",
	purple = "#c792ea",

	border = "#333333",
	border_light = "#555555",
	none = "NONE",
}

local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local function link(group, target)
	hl(group, { link = target })
end

function M.setup()
	-- ============================================================================
	-- Base UI
	-- ============================================================================

	hl("Normal", {
		fg = palette.fg,
		bg = palette.bg,
	})

	hl("NormalNC", {
		fg = palette.fg_soft,
		bg = palette.bg,
	})

	hl("NormalFloat", {
		fg = palette.fg,
		bg = palette.bg_alt,
	})

	hl("FloatBorder", {
		fg = palette.border_light,
		bg = palette.bg_alt,
	})

	hl("FloatTitle", {
		fg = palette.red,
		bg = palette.bg_alt,
		bold = true,
	})

	hl("Visual", {
		bg = palette.bg_visual,
		fg = palette.fg,
	})

	hl("CursorLine", {
		bg = palette.bg_soft,
	})

	hl("CursorLineNr", {
		fg = palette.red,
		bold = true,
	})

	hl("LineNr", {
		fg = palette.border_light,
	})

	hl("SignColumn", {
		bg = palette.none,
	})

	hl("FoldColumn", {
		fg = palette.border_light,
		bg = palette.none,
	})

	hl("Folded", {
		fg = palette.fg_muted,
		bg = palette.bg_soft,
		italic = true,
	})

	hl("WinSeparator", {
		fg = palette.border,
	})

	hl("ColorColumn", {
		bg = palette.bg_soft,
	})

	hl("VertSplit", {
		fg = palette.border,
	})

	hl("StatusLine", {
		fg = palette.fg_soft,
		bg = palette.bg_soft,
	})

	hl("StatusLineNC", {
		fg = palette.fg_muted,
		bg = palette.bg_alt,
	})

	hl("StatusLineTerm", {
		fg = palette.fg_soft,
		bg = palette.bg_soft,
	})

	hl("StatusLineTermNC", {
		fg = palette.fg_muted,
		bg = palette.bg_alt,
	})

	hl("TabLine", {
		fg = palette.fg_muted,
		bg = palette.bg_soft,
	})

	hl("TabLineSel", {
		fg = palette.bg,
		bg = palette.red,
		bold = true,
	})

	hl("TabLineFill", {
		bg = palette.bg,
	})

	-- ============================================================================
	-- Search / Menu / Messages
	-- ============================================================================

	hl("Search", {
		bg = palette.red,
		fg = palette.bg,
		bold = true,
	})

	hl("IncSearch", {
		bg = palette.fg,
		fg = palette.bg,
		bold = true,
	})

	hl("CurSearch", {
		bg = palette.red,
		fg = palette.bg,
		bold = true,
	})

	hl("Substitute", {
		bg = palette.red_dim,
		fg = palette.fg,
		bold = true,
	})

	hl("Pmenu", {
		bg = palette.bg_alt,
		fg = palette.fg_soft,
	})

	hl("PmenuSel", {
		bg = palette.red,
		fg = palette.bg,
		bold = true,
	})

	hl("PmenuSbar", {
		bg = palette.bg_soft,
	})

	hl("PmenuThumb", {
		bg = palette.red_dim,
	})

	hl("Question", {
		fg = palette.red,
		bold = true,
	})

	hl("MoreMsg", {
		fg = palette.green,
	})

	hl("WarningMsg", {
		fg = palette.orange,
	})

	hl("ErrorMsg", {
		fg = palette.red_soft,
		bold = true,
	})

	-- ============================================================================
	-- Diagnostics
	-- ============================================================================

	hl("DiagnosticError", { fg = palette.red_soft })
	hl("DiagnosticWarn", { fg = palette.orange })
	hl("DiagnosticInfo", { fg = palette.cyan })
	hl("DiagnosticHint", { fg = palette.green })
	hl("DiagnosticOk", { fg = palette.green })

	hl("DiagnosticSignError", { fg = palette.red_soft, bg = palette.none })
	hl("DiagnosticSignWarn", { fg = palette.orange, bg = palette.none })
	hl("DiagnosticSignInfo", { fg = palette.cyan, bg = palette.none })
	hl("DiagnosticSignHint", { fg = palette.green, bg = palette.none })
	hl("DiagnosticSignOk", { fg = palette.green, bg = palette.none })

	hl("DiagnosticVirtualTextError", { fg = palette.red_soft, bg = palette.none })
	hl("DiagnosticVirtualTextWarn", { fg = palette.orange, bg = palette.none })
	hl("DiagnosticVirtualTextInfo", { fg = palette.cyan, bg = palette.none })
	hl("DiagnosticVirtualTextHint", { fg = palette.green, bg = palette.none })

	hl("DiagnosticUnderlineError", { undercurl = true, sp = palette.red_soft })
	hl("DiagnosticUnderlineWarn", { undercurl = true, sp = palette.orange })
	hl("DiagnosticUnderlineInfo", { undercurl = true, sp = palette.cyan })
	hl("DiagnosticUnderlineHint", { undercurl = true, sp = palette.green })

	-- ============================================================================
	-- Generic syntax
	-- ============================================================================

	hl("Comment", {
		fg = palette.comment,
		italic = true,
	})

	hl("String", {
		fg = palette.green_soft,
	})

	hl("Character", {
		fg = palette.green_soft,
	})

	hl("Number", {
		fg = palette.orange,
	})

	hl("Boolean", {
		fg = palette.orange,
		bold = true,
	})

	hl("Float", {
		fg = palette.orange,
	})

	hl("Identifier", {
		fg = palette.fg_soft,
	})

	hl("Function", {
		fg = palette.fg,
		bold = true,
	})

	hl("Statement", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("Conditional", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("Repeat", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("Label", {
		fg = palette.red_pale,
	})

	hl("Operator", {
		fg = palette.fg_muted,
	})

	hl("Keyword", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("Exception", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("PreProc", {
		fg = palette.purple,
	})

	hl("Include", {
		fg = palette.purple,
	})

	hl("Define", {
		fg = palette.purple,
	})

	hl("Macro", {
		fg = palette.fg,
		italic = true,
	})

	hl("Type", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("StorageClass", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("Structure", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("Typedef", {
		fg = palette.red_pale,
	})

	hl("Special", {
		fg = palette.red_light,
	})

	hl("SpecialChar", {
		fg = palette.red_light,
	})

	hl("Tag", {
		fg = palette.red_soft,
	})

	hl("Delimiter", {
		fg = palette.fg_muted,
	})

	hl("Debug", {
		fg = palette.orange,
	})

	hl("Underlined", {
		underline = true,
	})

	hl("Ignore", {
		fg = palette.comment,
	})

	hl("Error", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("Todo", {
		fg = palette.bg,
		bg = palette.yellow,
		bold = true,
	})

	-- ============================================================================
	-- Treesitter general
	-- ============================================================================

	link("@comment", "Comment")
	link("@string", "String")
	link("@string.documentation", "String")
	link("@string.escape", "SpecialChar")
	link("@string.special", "Special")
	link("@character", "Character")
	link("@number", "Number")
	link("@number.float", "Float")
	link("@boolean", "Boolean")

	link("@variable", "Identifier")
	hl("@variable.builtin", {
		fg = palette.red,
		bold = true,
	})
	hl("@variable.parameter", {
		fg = palette.fg_soft,
		italic = true,
	})
	hl("@variable.member", {
		fg = palette.fg_soft,
	})

	link("@constant", "Constant")
	hl("@constant.builtin", {
		fg = palette.orange,
		bold = true,
	})
	hl("@constant.macro", {
		fg = palette.purple,
		italic = true,
	})

	link("@module", "Include")
	link("@label", "Label")

	link("@function", "Function")
	hl("@function.builtin", {
		fg = palette.fg,
		bold = true,
	})
	hl("@function.call", {
		fg = palette.fg,
	})
	hl("@function.method", {
		fg = palette.fg,
		bold = true,
	})
	hl("@function.method.call", {
		fg = palette.fg,
	})
	hl("@function.macro", {
		fg = palette.fg,
		italic = true,
	})

	link("@constructor", "Special")
	link("@operator", "Operator")

	link("@keyword", "Keyword")
	link("@keyword.function", "Keyword")
	link("@keyword.operator", "Keyword")
	link("@keyword.return", "Keyword")
	link("@keyword.conditional", "Conditional")
	link("@keyword.repeat", "Repeat")
	link("@keyword.exception", "Exception")
	link("@keyword.import", "Include")
	link("@keyword.storage", "StorageClass")

	link("@type", "Type")
	hl("@type.builtin", {
		fg = palette.red_pale,
		italic = true,
	})
	link("@type.definition", "Typedef")
	link("@attribute", "PreProc")
	link("@property", "Identifier")

	link("@punctuation.delimiter", "Delimiter")
	link("@punctuation.bracket", "Delimiter")
	link("@punctuation.special", "Special")

	hl("@tag", {
		fg = palette.red_soft,
	})
	hl("@tag.attribute", {
		fg = palette.red_pale,
		italic = true,
	})
	hl("@tag.delimiter", {
		fg = palette.fg_muted,
	})

	-- ============================================================================
	-- LSP semantic tokens general
	-- ============================================================================

	hl("@lsp.type.namespace", {
		fg = palette.fg_muted,
	})

	hl("@lsp.type.class", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("@lsp.type.interface", {
		fg = palette.red_light,
		italic = true,
	})

	hl("@lsp.type.enum", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("@lsp.type.enumMember", {
		fg = palette.orange,
	})

	hl("@lsp.type.struct", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("@lsp.type.type", {
		fg = palette.red_pale,
	})

	hl("@lsp.type.typeParameter", {
		fg = palette.red_light,
		italic = true,
	})

	hl("@lsp.type.parameter", {
		fg = palette.fg_soft,
		italic = true,
	})

	hl("@lsp.type.variable", {
		fg = palette.fg_soft,
	})

	hl("@lsp.type.property", {
		fg = palette.fg_soft,
	})

	hl("@lsp.type.method", {
		fg = palette.fg,
		bold = true,
	})

	hl("@lsp.type.function", {
		fg = palette.fg,
		bold = true,
	})

	hl("@lsp.type.macro", {
		fg = palette.fg,
		italic = true,
	})

	hl("@lsp.type.decorator", {
		fg = palette.purple,
	})

	hl("@lsp.type.keyword", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("@lsp.mod.deprecated", {
		strikethrough = true,
	})

	hl("@lsp.mod.readonly", {
		italic = true,
	})

	-- ============================================================================
	-- Rust specific
	-- ============================================================================

	hl("@lsp.type.trait.rust", {
		fg = palette.red_light,
		italic = true,
		bold = true,
	})

	hl("@lsp.type.lifetime.rust", {
		fg = palette.red_soft,
		italic = true,
	})

	hl("@lsp.type.selfKeyword.rust", {
		fg = palette.red,
		bold = true,
	})

	hl("@keyword.rust", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("@function.macro.rust", {
		fg = palette.fg,
		italic = true,
	})

	-- ============================================================================
	-- Java specific
	-- ============================================================================

	hl("@lsp.type.class.java", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("@lsp.type.interface.java", {
		fg = palette.red_light,
		italic = true,
		bold = true,
	})

	hl("@lsp.type.enum.java", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("@lsp.type.annotation.java", {
		fg = palette.purple,
		italic = true,
	})

	hl("@lsp.type.method.java", {
		fg = palette.fg,
		bold = true,
	})

	hl("@keyword.import.java", {
		fg = palette.purple,
	})

	-- ============================================================================
	-- TypeScript / JavaScript specific
	-- ============================================================================

	hl("@lsp.type.interface.typescript", {
		fg = palette.red_light,
		italic = true,
	})

	hl("@lsp.type.class.typescript", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("@lsp.type.enum.typescript", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("@lsp.type.type.typescript", {
		fg = palette.red_pale,
	})

	hl("@constructor.typescript", {
		fg = palette.red_light,
	})

	hl("@constructor.tsx", {
		fg = palette.red_light,
	})

	-- ============================================================================
	-- Markdown
	-- ============================================================================

	hl("@markup.heading", {
		fg = palette.red,
		bold = true,
	})

	hl("@markup.heading.1", {
		fg = palette.red,
		bold = true,
	})

	hl("@markup.heading.2", {
		fg = palette.red_soft,
		bold = true,
	})

	hl("@markup.heading.3", {
		fg = palette.red_pale,
		bold = true,
	})

	hl("@markup.strong", {
		bold = true,
	})

	hl("@markup.italic", {
		italic = true,
	})

	hl("@markup.link", {
		fg = palette.cyan,
		underline = true,
	})

	hl("@markup.link.url", {
		fg = palette.cyan,
		underline = true,
	})

	hl("@markup.raw", {
		fg = palette.green_soft,
	})

	-- ============================================================================
	-- Git / Diff
	-- ============================================================================

	hl("DiffAdd", {
		fg = palette.green,
		bg = palette.none,
	})

	hl("DiffChange", {
		fg = palette.orange,
		bg = palette.none,
	})

	hl("DiffDelete", {
		fg = palette.red_soft,
		bg = palette.none,
	})

	hl("DiffText", {
		fg = palette.yellow,
		bg = palette.none,
		bold = true,
	})

	hl("GitSignsAdd", {
		fg = palette.green,
		bg = palette.none,
	})

	hl("GitSignsChange", {
		fg = palette.orange,
		bg = palette.none,
	})

	hl("GitSignsDelete", {
		fg = palette.red_soft,
		bg = palette.none,
	})

	-- ============================================================================
	-- DAP
	-- ============================================================================

	hl("DapBreakpoint", {
		fg = palette.red_soft,
	})

	hl("DapBreakpointCondition", {
		fg = palette.orange,
	})

	hl("DapBreakpointRejected", {
		fg = palette.fg_muted,
	})

	hl("DapLogPoint", {
		fg = palette.cyan,
	})

	hl("DapStopped", {
		fg = palette.green,
	})

	hl("DapStoppedLine", {
		bg = "#1a1a1a",
	})

	-- ============================================================================
	-- Telescope
	-- ============================================================================

	hl("TelescopeNormal", {
		fg = palette.fg,
		bg = palette.bg_alt,
	})

	hl("TelescopeBorder", {
		fg = palette.border_light,
		bg = palette.bg_alt,
	})

	hl("TelescopePromptNormal", {
		fg = palette.fg,
		bg = palette.bg_soft,
	})

	hl("TelescopePromptBorder", {
		fg = palette.red,
		bg = palette.bg_soft,
	})

	hl("TelescopePromptTitle", {
		fg = palette.bg,
		bg = palette.red,
		bold = true,
	})

	hl("TelescopeSelection", {
		fg = palette.fg,
		bg = palette.bg_selection,
		bold = true,
	})

	hl("TelescopeMatching", {
		fg = palette.red,
		bold = true,
	})

	-- ============================================================================
	-- WhichKey
	-- ============================================================================

	hl("WhichKey", {
		fg = palette.red,
		bold = true,
	})

	hl("WhichKeyGroup", {
		fg = palette.red_pale,
	})

	hl("WhichKeyDesc", {
		fg = palette.fg,
	})

	hl("WhichKeySeparator", {
		fg = palette.comment,
	})

	hl("WhichKeyFloat", {
		bg = palette.bg_alt,
	})

	hl("WhichKeyBorder", {
		fg = palette.border_light,
		bg = palette.bg_alt,
	})

	-- ============================================================================
	-- Trouble / Quickfix
	-- ============================================================================

	hl("TroubleNormal", {
		fg = palette.fg,
		bg = palette.bg,
	})

	hl("TroubleNormalNC", {
		fg = palette.fg_soft,
		bg = palette.bg,
	})

	hl("QuickFixLine", {
		bg = palette.bg_soft,
		bold = true,
	})

	-- ============================================================================
	-- Blink completion
	-- ============================================================================

	hl("BlinkCmpMenu", {
		fg = palette.fg_soft,
		bg = palette.bg_alt,
	})

	hl("BlinkCmpMenuSelection", {
		fg = palette.bg,
		bg = palette.red,
		bold = true,
	})

	hl("BlinkCmpLabel", {
		fg = palette.fg_soft,
	})

	hl("BlinkCmpLabelMatch", {
		fg = palette.red,
		bold = true,
	})

	hl("BlinkCmpKind", {
		fg = palette.red_pale,
	})

	hl("BlinkCmpDoc", {
		fg = palette.fg_soft,
		bg = palette.bg_alt,
	})

	hl("BlinkCmpDocBorder", {
		fg = palette.border_light,
		bg = palette.bg_alt,
	})

	-- ============================================================================
	-- Noice / Notify
	-- ============================================================================

	hl("NoiceCmdlinePopup", {
		bg = palette.bg_alt,
		fg = palette.fg,
	})

	hl("NoiceCmdlinePopupBorder", {
		bg = palette.bg_alt,
		fg = palette.red,
	})

	hl("NoiceCmdlineIcon", {
		fg = palette.red,
	})

	hl("NotifyERRORBorder", { fg = palette.red_soft })
	hl("NotifyWARNBorder", { fg = palette.orange })
	hl("NotifyINFOBorder", { fg = palette.cyan })
	hl("NotifyDEBUGBorder", { fg = palette.comment })
	hl("NotifyTRACEBorder", { fg = palette.purple })

	hl("NotifyERRORTitle", { fg = palette.red_soft, bold = true })
	hl("NotifyWARNTitle", { fg = palette.orange, bold = true })
	hl("NotifyINFOTitle", { fg = palette.cyan, bold = true })
	hl("NotifyDEBUGTitle", { fg = palette.comment, bold = true })
	hl("NotifyTRACETitle", { fg = palette.purple, bold = true })

	-- ============================================================================
	-- Inlay hints
	-- ============================================================================

	hl("LspInlayHint", {
		fg = palette.comment,
		bg = palette.none,
		italic = true,
	})

	-- ============================================================================
	-- Lualine
	-- ============================================================================

	hl("lualine_a_normal", {
		fg = palette.bg,
		bg = palette.red,
		bold = true,
	})

	hl("lualine_a_insert", {
		fg = palette.bg,
		bg = palette.green,
		bold = true,
	})

	hl("lualine_a_visual", {
		fg = palette.bg,
		bg = palette.purple,
		bold = true,
	})

	hl("lualine_a_replace", {
		fg = palette.bg,
		bg = palette.orange,
		bold = true,
	})

	hl("lualine_a_command", {
		fg = palette.bg,
		bg = palette.red_pale,
		bold = true,
	})

	hl("lualine_b_normal", {
		fg = palette.red,
		bg = palette.bg_soft,
	})

	hl("lualine_b_insert", {
		fg = palette.green,
		bg = palette.bg_soft,
	})

	hl("lualine_b_visual", {
		fg = palette.purple,
		bg = palette.bg_soft,
	})

	hl("lualine_b_replace", {
		fg = palette.orange,
		bg = palette.bg_soft,
	})

	hl("lualine_b_command", {
		fg = palette.red_pale,
		bg = palette.bg_soft,
	})

	hl("lualine_c_normal", {
		fg = palette.fg_soft,
		bg = palette.bg_alt,
	})

	hl("lualine_c_insert", {
		fg = palette.fg_soft,
		bg = palette.bg_alt,
	})

	hl("lualine_c_visual", {
		fg = palette.fg_soft,
		bg = palette.bg_alt,
	})

	hl("lualine_c_replace", {
		fg = palette.fg_soft,
		bg = palette.bg_alt,
	})

	hl("lualine_c_command", {
		fg = palette.fg_soft,
		bg = palette.bg_alt,
	})

	hl("lualine_x_normal", {
		fg = palette.fg_muted,
		bg = palette.bg_alt,
	})

	hl("lualine_y_normal", {
		fg = palette.red,
		bg = palette.bg_soft,
	})

	hl("lualine_z_normal", {
		fg = palette.bg,
		bg = palette.red,
		bold = true,
	})
end

return M
