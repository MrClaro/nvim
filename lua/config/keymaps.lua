-- =============================================================================
-- KEYMAPS
-- =============================================================================

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- =============================================================================
-- 1. NAVIGATION
-- =============================================================================

-- Centralized Scroll
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- J dont move cursor when joining lines
keymap.set("n", "J", "mzJ`z", opts)
keymap.set("n", "K", "mzK`z", opts)

-- Centralize when navigating paragraphs and searches
keymap.set("n", "{", "{zz", opts)
keymap.set("n", "}", "}zz", opts)
keymap.set("n", "n", "nzzzv", opts) -- zzzv instead of zz: centralize and open folds if the match is in a closed fold
keymap.set("n", "N", "Nzzzv", opts)

-- Exit insert mode with jk, jj ou Ctrl-c
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", "jj", "<ESC>", opts)
keymap.set("i", "<C-c>", "<Esc>", opts)

-- Disable Q
keymap.set("n", "Q", "<nop>", opts)

-- =============================================================================
-- 2. YANK, DELETE E PASTE
-- =============================================================================

-- Delete without copying to clipboard (using the black hole register)
keymap.set("n", "x", '"_x', opts)
keymap.set({ "n", "v" }, "<Leader>d", '"_d', opts)
keymap.set({ "n", "v" }, "<Leader>D", '"_D', opts)
keymap.set({ "n", "v" }, "<Leader>c", '"_c', opts)
keymap.set({ "n", "v" }, "<Leader>C", '"_C', opts)

-- Paste from register 0 (last explicit yank) without overwriting the default register
keymap.set("n", "<Leader>p", '"0p', opts)
keymap.set("n", "<Leader>P", '"0P', opts)
keymap.set("v", "<Leader>p", '"0p', opts)

-- Paste in visual mode without overwriting the default register (using the black hole register)
keymap.set("x", "<leader>p", [["_dP]], opts)

-- Yank to system clipboard (using the + register)
keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
keymap.set("n", "<leader>Y", [["+Y]], opts)

-- Save
keymap.set("n", "<C-s>", "<cmd>w<CR>", opts)
keymap.set("n", "<leader>sn", "<cmd>noautocmd w<CR>", { desc = "Save without formatting" })

-- Rename word under cursor (search and replace)
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename word" })

-- Reindent paragraph while keeping cursor position (useful after pasting code that may be misindented)
keymap.set("n", "=ap", "ma=ap'a", opts)

-- Numbers
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Blank line below/above without entering insert mode (useful for quickly adding lines without disrupting the current workflow)
keymap.set("n", "<M-o>", "o<Esc>^Da", opts)
keymap.set("n", "<M-O>", "O<Esc>^Da", opts)

-- Toggle wrap
keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" })

-- chmod +x on current file (useful for scripts)
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "chmod +x", silent = true })

-- Source of current file (useful when editing configs)
keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source file" })

-- Restart LSP
keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- =============================================================================
-- 3. WINDOW & BUFFER
-- =============================================================================

-- Splits
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

-- Navigation inside splits with s + direction
-- TODO: sh conflicts with surround
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- Navigation inside splits with Ctrl + direction
keymap.set("n", "<C-h>", "<C-w>h", opts)
-- keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap.set("n", "<up>", "<cmd>resize -2<CR>", opts)
keymap.set("n", "<down>", "<cmd>resize +2<CR>", opts)
keymap.set("n", "<left>", "<cmd>vertical resize -2<CR>", opts)
keymap.set("n", "<right>", "<cmd>vertical resize +2<CR>", opts)

-- =============================================================================
-- 4. VISUAL MODE
-- =============================================================================

-- Maintains the visual selection after indenting, allowing for multiple indents without losing the selection
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move selected lines down with J and up with K, while keeping the selection active for further moves if needed
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- =============================================================================
-- 5. QUICKFIX / LOCATION LIST
-- =============================================================================

keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Quickfix next" })
keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Quickfix prev" })
keymap.set("n", "<A-n>", "<cmd>lnext<CR>zz", { desc = "Loclist next" })
keymap.set("n", "<A-p>", "<cmd>lprev<CR>zz", { desc = "Loclist prev" })

-- =============================================================================
-- 6. AUTOCMDS
-- =============================================================================

-- Add line below/above without entering insert mode (overrides the default behavior of o/O)
vim.schedule(function()
  vim.keymap.set("n", "<leader>o", "o<Esc>", opts)
  vim.keymap.set("n", "<leader>O", "O<Esc>", opts)
end)

-- LSP diagnostics
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspDiagnostics", {}),
  callback = function()
    vim.keymap.set("n", "<C-j>", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, { buffer = true, desc = "Next diagnostic" })
    vim.keymap.set("n", "<C-k>", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, { buffer = true, desc = "Previous diagnostic" })
  end,
})

-- LazyGit
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("UserLazyGit", {}),
  callback = function()
    pcall(vim.keymap.del, "n", "<leader>l")
    vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
  end,
})

-- =============================================================================
-- 7. Buffers
-- =============================================================================
keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })
keymap.set("n", "<tab>", "<cmd>bnext<CR>", opts)
keymap.set("n", "<s-tab>", "<cmd>bprevious<CR>", opts)
keymap.set("n", "<leader>bd", function()
  local buf = vim.api.nvim_get_current_buf()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })

  if #buffers <= 1 then
    vim.cmd("bd!")
  else
    vim.cmd("bp")
    vim.cmd("bd " .. buf)
  end
end, { desc = "Close buffer" })
keymap.set("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })

-- Closes all buffers to the left of the current one
vim.keymap.set("n", "<leader>bh", function()
  local current = vim.fn.bufnr("%")
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buf in ipairs(buffers) do
    if buf.bufnr < current then
      vim.cmd("bd " .. buf.bufnr)
    end
  end
end, { desc = "Close buffers to the left" })

-- Closes all buffers to the right of the current one
vim.keymap.set("n", "<leader>bl", function()
  local current = vim.fn.bufnr("%")
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buf in ipairs(buffers) do
    if buf.bufnr > current then
      vim.cmd("bd " .. buf.bufnr)
    end
  end
end, { desc = "Close buffers to the right" })

-- Closes all buffers except the current one
vim.keymap.set("n", "<leader>bo", function()
  local current = vim.fn.bufnr("%")
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buf in ipairs(buffers) do
    if buf.bufnr ~= current then
      vim.cmd("bd " .. buf.bufnr)
    end
  end
end, { desc = "Close all other buffers" })

-- =============================================================================
-- 8. FallBack
-- =============================================================================
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
