-- =============================================================================
-- KEYMAPS
-- =============================================================================

local map = vim.keymap.set

local opts = {
	noremap = true,
	silent = true,
}

-- =============================================================================
-- NAVIGATION
-- =============================================================================

map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

map("n", "J", "mzJ`z", opts)
map("n", "K", "mzK`z", opts)

map("n", "{", "{zz", opts)
map("n", "}", "}zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

map("i", "jk", "<Esc>", opts)
map("i", "jj", "<Esc>", opts)
map("i", "<C-c>", "<Esc>", opts)

map("n", "Q", "<nop>", opts)

-- =============================================================================
-- YANK / DELETE / PASTE
-- =============================================================================

map("n", "x", '"_x', opts)

map({ "n", "v" }, "<leader>d", '"_d', {
	desc = "Delete without yanking",
})

map({ "n", "v" }, "<leader>D", '"_D', {
	desc = "Delete line without yanking",
})

map({ "n", "v" }, "<leader>c", '"_c', {
	desc = "Change without yanking",
})

map({ "n", "v" }, "<leader>C", '"_C', {
	desc = "Change line without yanking",
})

map("n", "<leader>p", '"0p', {
	desc = "Paste from yank register",
})

map("n", "<leader>P", '"0P', {
	desc = "Paste before from yank register",
})

map("x", "<leader>p", [["_dP]], {
	desc = "Paste without replacing register",
})

map({ "n", "v" }, "<leader>y", [["+y]], {
	desc = "Yank to system clipboard",
})

map("n", "<leader>Y", [["+Y]], {
	desc = "Yank line to system clipboard",
})

-- =============================================================================
-- EDITING
-- =============================================================================

map("n", "<C-s>", "<cmd>w<cr>", {
	desc = "Save file",
})

map("n", "<leader>sn", "<cmd>noautocmd w<cr>", {
	desc = "Save without formatting",
})

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
	desc = "Replace word under cursor",
})

map("n", "=ap", "ma=ap'a", {
	desc = "Reindent paragraph",
})

map("n", "+", "<C-a>", {
	desc = "Increment number",
})

map("n", "-", "<C-x>", {
	desc = "Decrement number",
})

map("n", "<leader>va", "ggVG", {
	desc = "Select all",
})

map("n", "<M-o>", "o<Esc>^Da", {
	desc = "Add blank line below",
})

map("n", "<M-O>", "O<Esc>^Da", {
	desc = "Add blank line above",
})

map("n", "<leader>o", "o<Esc>", {
	desc = "Add line below",
})

map("n", "<leader>O", "O<Esc>", {
	desc = "Add line above",
})

map("n", "<leader>lw", "<cmd>set wrap!<cr>", {
	desc = "Toggle line wrap",
})

map("n", "<leader>x", "<cmd>silent !chmod +x %<cr>", {
	desc = "chmod +x current file",
})

map("n", "<leader>cS", "<cmd>source %<cr>", {
	desc = "Source current file",
})

-- =============================================================================
-- WINDOWS
-- =============================================================================

map("n", "ss", "<cmd>split<cr>", {
	desc = "Horizontal split",
})

map("n", "sv", "<cmd>vsplit<cr>", {
	desc = "Vertical split",
})

-- Avoid using sh because it conflicts with surround-style workflows.
map("n", "<leader>wh", "<C-w>h", {
	desc = "Move to left window",
})

map("n", "<leader>wj", "<C-w>j", {
	desc = "Move to lower window",
})

map("n", "<leader>wk", "<C-w>k", {
	desc = "Move to upper window",
})

map("n", "<leader>wl", "<C-w>l", {
	desc = "Move to right window",
})

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<Up>", "<cmd>resize -2<cr>", {
	desc = "Resize window up",
})

map("n", "<Down>", "<cmd>resize +2<cr>", {
	desc = "Resize window down",
})

map("n", "<Left>", "<cmd>vertical resize -2<cr>", {
	desc = "Resize window left",
})

map("n", "<Right>", "<cmd>vertical resize +2<cr>", {
	desc = "Resize window right",
})

-- =============================================================================
-- VISUAL MODE
-- =============================================================================

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("v", "J", ":m '>+1<cr>gv=gv", {
	desc = "Move selection down",
})

map("v", "K", ":m '<-2<cr>gv=gv", {
	desc = "Move selection up",
})

-- =============================================================================
-- QUICKFIX / LOCATION LIST
-- =============================================================================

map("n", "<C-n>", "<cmd>cnext<cr>zz", {
	desc = "Quickfix next",
})

map("n", "<C-p>", "<cmd>cprev<cr>zz", {
	desc = "Quickfix previous",
})

map("n", "<A-n>", "<cmd>lnext<cr>zz", {
	desc = "Location list next",
})

map("n", "<A-p>", "<cmd>lprev<cr>zz", {
	desc = "Location list previous",
})

-- =============================================================================
-- BUFFERS
-- =============================================================================

map("n", "<leader>q", "<cmd>bd<cr>", {
	desc = "Close buffer",
})

map("n", "<leader>bd", function()
	local current = vim.api.nvim_get_current_buf()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })

	if #buffers <= 1 then
		vim.cmd("bd!")
		return
	end

	vim.cmd("bp")
	vim.cmd("bd " .. current)
end, {
	desc = "Close buffer",
})

map("n", "<leader>bn", "<cmd>enew<cr>", {
	desc = "New buffer",
})

map("n", "<leader>bh", function()
	local current = vim.fn.bufnr("%")
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })

	for _, buf in ipairs(buffers) do
		if buf.bufnr < current then
			pcall(function()
				vim.cmd("bd " .. buf.bufnr)
			end)
		end
	end
end, {
	desc = "Close buffers to the left",
})

map("n", "<leader>bl", function()
	local current = vim.fn.bufnr("%")
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })

	for _, buf in ipairs(buffers) do
		if buf.bufnr > current then
			pcall(function()
				vim.cmd("bd " .. buf.bufnr)
			end)
		end
	end
end, {
	desc = "Close buffers to the right",
})

map("n", "<leader>bo", function()
	local current = vim.fn.bufnr("%")
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })

	for _, buf in ipairs(buffers) do
		if buf.bufnr ~= current then
			pcall(function()
				vim.cmd("bd " .. buf.bufnr)
			end)
		end
	end
end, {
	desc = "Close all other buffers",
})
