--- =============================================================================
-- OPTIONS
-- =============================================================================

vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =============================================================================
-- UI
-- =============================================================================

vim.opt.title = true
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.cmdheight = 0

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = ""

vim.opt.termguicolors = true
vim.opt.pumblend = 0
vim.opt.winblend = 0

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

vim.opt.diffopt:append({
	"algorithm:histogram",
	"indent-heuristic",
})

-- =============================================================================
-- BEHAVIOR
-- =============================================================================

vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.confirm = true
vim.opt.hidden = true
vim.opt.backspace = { "indent", "eol", "start" }

-- 50 can be too aggressive in larger projects with LSP, gitsigns and diagnostics.
vim.opt.updatetime = 200

-- =============================================================================
-- ENCODING
-- =============================================================================

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "latin1" }

-- =============================================================================
-- SEARCH
-- =============================================================================

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
	vim.opt.grepformat = "%f:%l:%c:%m"
end

-- =============================================================================
-- INDENTATION
-- =============================================================================

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true

-- =============================================================================
-- TEXT
-- =============================================================================

vim.opt.wrap = false
vim.opt.linebreak = true

-- Do not continue comments automatically with "o" / "O".
-- Keeps "r", so comments still continue when pressing Enter in insert mode.
vim.opt.formatoptions:remove({ "o" })

vim.opt.isfname:append("@-@")

-- =============================================================================
-- COMPLETION
-- =============================================================================

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.shortmess:append({
	W = true,
	I = true,
	c = true,
	C = true,
})

-- =============================================================================
-- FILES / BACKUP / UNDO
-- =============================================================================

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.undofile = true

local undo_dir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undo_dir, "p")
vim.opt.undodir = undo_dir

vim.opt.path:append({ "**" })

vim.opt.wildignore:append({
	"*/.git/*",
	"*/node_modules/*",
	"*/target/*",
	"*/dist/*",
	"*/build/*",
	"*/.next/*",
	"*/coverage/*",
	"*/vendor/*",
})

-- =============================================================================
-- FOLDS
-- =============================================================================

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
