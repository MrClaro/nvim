-- =============================================================================
-- OPTIONS
-- =============================================================================
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

vim.g.mapleader = " "

-- Timeout
vim.o.timeoutlen = 500

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Cursor & appearance
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.laststatus = 3
-- avoid the "jumping" layout when LSP diagnostics are added by always reserving space for the sign column (where diagnostics appear)
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- Performance
-- Set a shorter update time for CursorHold events (used by LSP and gitsigns)
vim.opt.updatetime = 50

-- Search
vim.opt.hlsearch = true
-- highlight matches from the start of the search until you move the cursor, then clear the highlight (more responsive than hlsearch alone)
vim.opt.incsearch = true
vim.opt.ignorecase = true
-- Good practice: only ignore case if the search pattern is all lowercase, otherwise be case-sensitive
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.breakindent = true

-- Text
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }

-- Scroll
vim.opt.scrolloff = 10

-- Colors
vim.opt.termguicolors = true

-- Persistence Undo
-- Disable swap and backup files, but enable undo files with a specific directory for storage
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Color column (disabled by default, can be enabled for specific file types in ftplugin)
vim.opt.colorcolumn = ""

-- Window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

-- File searching
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Format options
vim.opt.formatoptions:append({ "r" })

-- isfname: allows "gf" to work with file names that include "@" and "-" (common in email addresses and some file names)
vim.opt.isfname:append("@-@")

-- Terminal (undercurl support)
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- File type associations
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

-- Hides the command line when not in use (requires Neovim 0.8+)
if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end
