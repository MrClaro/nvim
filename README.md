# Neovim Configuration

A modern Neovim setup powered by LazyVim with enhanced productivity features.

## Prerequisites

- Neovim >= 0.9.0
- Git >= 2.19
- A Nerd Font (for icons)
- `make` (for compiling plugins)
- `node` (for LSP and JS/TS support)

## Installation

### Backup existing config (optional)

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

### Clone this config

```bash
git clone https://github.com/MrClaro/nvim ~/.config/nvim
```

### Install dependencies

```bash
# Install Node.js (for LSP and JS support)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install make
sudo apt-get install -y build-essential

# Install lazy.nvim dependencies
nvim --headless "+Lazy! sync" +qa
```

### Fonts

```bash
# Download and install a Nerd Font
# https://github.com/ryanoasis/nerd-fonts#font-installation
```

## Keybindings

### Leader Key

`<Space>` is the leader key.

---

### General

| Key | Description |
|-----|-------------|
| `<Space><Space>` | Telescope: Find files |
| `<Space>ff` | Telescope: Find files |
| `<Space>fr` | Telescope: Recent files |
| `<Space>fg` | Telescope: Git files |
| `<Space>/` | Telescope: Live grep |
| `<Space>fw` | Telescope: Grep word under cursor |
| `<Space>fs` | Telescope: Search in project |
| `<Space>fb` | Telescope: Open buffers |
| `<Space>fd` | Telescope: Diagnostics |
| `<Space>fD` | Telescope: LSP definitions |
| `<Space>fi` | Telescope: LSP implementations |
| `<Space>ft` | Telescope: LSP type definitions |
| `<Space>fh` | Telescope: Help tags |
| `<Space>fk` | Telescope: Keymaps |
| `<Space>fc` | Telescope: Commands |
| `<Space>f:` | Telescope: Command history |
| `<Ctrl-s>` | Save file |
| `<Space>sn` | Save without formatting |
| `<Space>lw` | Toggle line wrap |
| `<Space>x` | chmod +x on current file |
| `<Space><Leader>` | Source current file |

---

### Navigation

| Key | Description |
|-----|-------------|
| `<Ctrl-d>` | Scroll down (centered) |
| `<Ctrl-u>` | Scroll up (centered) |
| `J` | Join lines (keep cursor position) |
| `K` | Join lines up (keep cursor position) |
| `{` | Previous paragraph (centered) |
| `}` | Next paragraph (centered) |
| `n` | Next search match (centered) |
| `N` | Previous search match (centered) |
| `ss` | Horizontal split |
| `sv` | Vertical split |
| `sh` | Move to left window |
| `sk` | Move to top window |
| `sj` | Move to bottom window |
| `sl` | Move to right window |
| `<Ctrl-h>` | Move to left window |
| `<Ctrl-l>` | Move to right window |
| `<Up>` | Resize window up |
| `<Down>` | Resize window down |
| `<Left>` | Resize window left |
| `<Right>` | Resize window right |

---

### Buffers

| Key | Description |
|-----|-------------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<Space>bd` | Close buffer |
| `<Space>bn` | New buffer |
| `<Space>bh` | Close buffers to the left |
| `<Space>bl` | Close buffers to the right |
| `<Space>bo` | Close all other buffers |

---

### LSP

| Key | Description |
|-----|-------------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | References |
| `gt` | Go to type definition |
| `K` | Hover docs |
| `<Alt-k>` | Hover docs |
| `<Space>k` | Signature help |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code action |
| `<Space>dl` | Diagnostic float |
| `<Ctrl-j>` | Next diagnostic |
| `<Ctrl-k>` | Previous diagnostic |
| `<Space>zig` | Restart LSP |

---

### Git

| Key | Description |
|-----|-------------|
| `<Space>lg` | Open LazyGit |
| `<Space>gf` | Open LazyGit Filter |
| `<Space>gc` | Open LazyGit Config |
| `<Space>gb` | Git Blame |
| `<Space>gd` | Git Diff |
| `<Space>gp` | Preview Hunk |

---

### File Explorer (Neo-tree)

| Key | Description |
|-----|-------------|
| `<Space>e` | Toggle file explorer |
| `<Space>E` | Focus file explorer |
| `<Space>ge` | Git status (Neotree) |

---

### Debug (DAP)

| Key | Description |
|-----|-------------|
| `<Space>dc` | Continue |
| `<Space>dso` | Step over |
| `<Space>dsi` | Step into |
| `<Space>dsu` | Step out |
| `<Space>db` | Toggle breakpoint |
| `<Space>dB` | Conditional breakpoint |
| `<Space>dl` | Log point |
| `<Space>du` | Toggle DAP UI |
| `<Space>de` | Eval expression |
| `<Space>dr` | Open REPL |
| `<Space>dq` | Terminate |
| `<Space>dC` | Clear all breakpoints |

---

### Productivity

| Key | Description |
|-----|-------------|
| `<Space>u` | Toggle Undotree |
| `<Space>z` | Toggle Zen Mode |
| `<Space>sr` | GrugFar (Search and replace) |
| `<Space>sw` | GrugFar current word |
| `<Space>cs` | Symbols Outline |
| `<Space>cn` | Generate docstring (Neogen) |

---

### Refactoring (ThePrimeagen)

| Key | Description |
|-----|-------------|
| `<Space>re` | Extract Function (visual) |
| `<Space>rf` | Extract Function to File (visual) |
| `<Space>rv` | Extract Variable (visual) |
| `<Space>ri` | Inline Variable |
| `<Space>rI` | Inline Function |
| `<Space>rb` | Extract Block |

---

### Flash (Quick Navigation)

| Key | Description |
|-----|-------------|
| `zk` | Flash jump |
| `Zk` | Flash treesitter |
| `r` | Remote flash (operator) |
| `R` | Treesitter search |
| `<Ctrl-s>` | Toggle flash search (cmdline) |

---

### Markdown

| Key | Description |
|-----|-------------|
| `<Space>cp` | Color picker |
| `<Space>cc` | Convert color |

---

### HTTP Client (Kulala)

| Key | Description |
|-----|-------------|
| `<Space>Rr` | Run request |
| `<Space>Rs` | Run all requests |
| `<Space>Rp` | Previous request |
| `<Space>Rn` | Next request |
| `<Space>Rc` | Copy as cURL |
| `<Space>Ri` | Inspect request |

---

### Session

| Key | Description |
|-----|-------------|
| `<Space>ss` | Save session |
| `<Space>sl` | Load session |

---

### Todo Comments

| Key | Description |
|-----|-------------|
| `<Space>td` | Todo (Trouble) |
| `<Space>tf` | Todo (Telescope) |

---

### Trouble

| Key | Description |
|-----|-------------|
| `<Space>tx` | Diagnostics (Trouble) |
| `<Space>tX` | Buffer Diagnostics (Trouble) |
| `<Space>ts` | Symbols (Trouble) |
| `<Space>tl` | LSP Definitions/References (Trouble) |
| `<Space>tL` | Location List (Trouble) |
| `<Space>tQ` | Quickfix List (Trouble) |

---

### Quickfix / Location List

| Key | Description |
|-----|-------------|
| `<Ctrl-n>` | Next quickfix item |
| `<Ctrl-p>` | Previous quickfix item |
| `<Alt-n>` | Next location item |
| `<Alt-p>` | Previous location item |

---

### Visual Mode

| Key | Description |
|-----|-------------|
| `<` | Indent (keep selection) |
| `>` | Indent (keep selection) |
| `J` | Move line down (visual) |
| `K` | Move line up (visual) |
| `<Leader>p` | Paste (keep register) |

---

### Insert Mode

| Key | Description |
|-----|-------------|
| `jk` | Exit insert mode |
| `jj` | Exit insert mode |
| `<Ctrl-c>` | Exit insert mode |
| `<Ctrl-n>` | Next completion (blink.cmp) |
| `<Ctrl-p>` | Previous completion (blink.cmp) |
| `<Ctrl-Space>` | Show completion |
| `<Ctrl-e>` | Hide completion |
| `<Enter>` | Accept completion |
| `<Tab>` | Next snippet / Accept snippet |
| `<S-Tab>` | Previous snippet |
| `<Ctrl-l>` | Next snippet |
| `<Ctrl-h>` | Previous snippet |

---

### Misc

| Key | Description |
|-----|-------------|
| `<Space>s` | Search and replace word |
| `=` | Reindent paragraph |
| `+` | Increment number |
| `-` | Decrement number |
| `<Ctrl-a>` | Select all |
| `<Alt-o>` | Add blank line below |
| `<Alt-O>` | Add blank line above |
| `<Space>o` | Add line below |
| `<Space>O` | Add line above |

---

## Plugins

### Core

- **lazy.nvim** - Plugin manager
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP server manager
- **nvim-treesitter** - Syntax highlighting
- **blink.cmp** - Completion

### Editor

- **neo-tree.nvim** - File explorer
- **telescope.nvim** - Fuzzy finder
- **mini.nvim** - Mini plugins suite
- **snacks.nvim** - Dashboard and utilities

### UI

- **catppuccin** - Colorscheme
- **noice.nvim** - Messages UI
- **lualine.nvim** - Status line
- **bufferline.nvim** - Buffer tabs
- **trouble.nvim** - Diagnostics viewer

### Git

- **lazygit.nvim** - TUI git client
- **gitsigns.nvim** - Git signs
- **diffview.nvim** - Git diff viewer

### AI

- **avante.nvim** - AI assistant (Claude/Moonshot)
- **copilot.lua** - GitHub Copilot

### Debug

- **nvim-dap** - Debug Adapter Protocol
- **nvim-dap-ui** - DAP UI
- **nvim-dap-python** - Python debug
- **nvim-dap-go** - Go debug

### Productivity

- **flash.nvim** - Quick navigation
- **grug-far.nvim** - Search and replace
- **refactoring.nvim** - Refactoring tools
- **neogen** - Docstring generation
- **zen-mode.nvim** - Focus mode

### Mobile

- **flutter-tools.nvim** - Flutter tooling
- **nvim-java** - Java support

## Languages Supported

Treesitter parsers for: bash, c, cpp, css, dart, dockerfile, go, html, java, javascript, jsx, json, kotlin, lua, markdown, php, python, ruby, rust, sql, typescript, tsx, vue, yaml, and more.

LSP servers: angularls, cssls, dockerls, html, jsonls, kotlin_language_server, lua_ls, marksman, pyright, tailwindcss, tsserver, and more.

## Credits

Based on [LazyVim](https://github.com/LazyVim/LazyVim)
