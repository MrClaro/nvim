# MrClaro Neovim Setup

A modern, modular and productivity-focused Neovim configuration built around **Lazy.nvim**, with strong support for **Rust**, **Java**, **TypeScript/JavaScript**, **Flutter/Dart**, **Git workflows**, **debugging**, **AI-assisted development**, and a clean terminal-first editing experience.

This setup is designed for developers who want a fast, keyboard-driven IDE inside Neovim without losing the simplicity and composability of the editor.

---

## Highlights

- Modular plugin architecture organized by domain
- Rust-first workflow with `rustaceanvim`, `rust-analyzer`, `clippy`, `rustfmt`, and `codelldb`
- Full Debug Adapter Protocol setup for Rust, JavaScript/TypeScript, Python, Go, PHP, Lua, and Flutter/Dart
- AI-assisted development with Avante and OpenCode
- Modern completion powered by `blink.cmp`
- LSP support through `nvim-lspconfig`, `mason.nvim`, and language-specific integrations
- Treesitter-based syntax, navigation, context, and textobjects
- Git workflow with LazyGit, Gitsigns, Diffview, and Advanced Git Search
- Telescope-powered fuzzy finding
- Oil-based file explorer
- Formatting with Conform
- Diagnostics, Trouble, Todo comments, sessions, and project navigation
- Polished UI with Noirbuddy, Noice, Notify, Fidget, Lualine, Bufferline, Incline, and WhichKey

---

## Philosophy

This configuration is built around a simple idea:

> Neovim should be fast, modular, beautiful, and powerful enough to replace a full IDE while still feeling like Neovim.

The setup is organized by responsibility. Plugin specs live inside `lua/plugins`, while reusable internal modules live inside `lua/core`, and global editor configuration lives inside `lua/config`.

---

## Directory Structure

```text
lua/
  config/
    options.lua
    keymaps.lua
    autocmds.lua
    filetypes.lua
    diagnostics.lua
    lsp-keymaps.lua
    lazy.lua

  core/
    debug/
      init.lua
      keymaps.lua
      mason.lua
      signs.lua
      ui.lua
      adapters/
        js.lua
        rust.lua
        python.lua
        go.lua
        lua.lua
        php.lua
        dart.lua

    lsp/
      servers.lua

  plugins/
    ai/
    colors/
    completion/
    debug/
    editor/
    git/
    lang/
    lsp/
    navigation/
    productivity/
    search/
    tools/
    treesitter/
    ui/
    utility/
```

---

## Requirements

### Core

- Neovim 0.10+
- Git
- Make
- Ripgrep
- fd
- Node.js
- npm
- A Nerd Font
- LazyGit

### Recommended on Arch Linux

```bash
sudo pacman -S --needed \
  neovim git base-devel ripgrep fd fzf \
  nodejs npm rustup lldb clang \
  luarocks lazygit
```

### Rust Toolchain

This setup expects Rust to be managed by `rustup`, not Mason.

```bash
rustup default stable
rustup component add rust-analyzer rust-src clippy rustfmt
```

Verify:

```bash
which rust-analyzer
rust-analyzer --version
cargo clippy --version
```

Expected:

```text
~/.cargo/bin/rust-analyzer
```

---

## Installation

Back up your existing Neovim configuration:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Clone the repository:

```bash
git clone https://github.com/MrClaro/nvim ~/.config/nvim
```

Start Neovim:

```bash
nvim
```

Sync plugins:

```vim
:Lazy sync
```

Install external tools:

```vim
:Mason
```

---

## Plugin Categories

### AI

- `avante.nvim`
- `opencode.nvim`

Used for AI-assisted coding, refactoring, reviewing, and interacting with the current buffer or selected ranges.

### Completion

- `blink.cmp`
- `friendly-snippets`
- `copilot.lua`
- `blink-cmp-copilot`
- `blink-cmp-env`
- `lazydev.nvim`
- `lspkind.nvim`

Completion is powered by `blink.cmp`, with LSP, snippets, path, buffer, environment variables, LazyDev and Copilot sources.

### Rust

- `rustaceanvim`
- `rust-analyzer`
- `clippy`
- `rustfmt`
- `codelldb`

Rust is intentionally separated from Mason’s LSP installation flow. The Rust toolchain is managed by `rustup`, while Neovim integrates with it through `rustaceanvim`.

### Debug

- `nvim-dap`
- `nvim-dap-ui`
- `mason-nvim-dap`
- `nvim-dap-python`
- `nvim-dap-go`
- `nvim-dap-vscode-js`
- `codelldb`

DAP adapters are modularized by language under `lua/core/debug/adapters`.

### LSP

- `nvim-lspconfig`
- `mason.nvim`
- `mason-lspconfig.nvim`
- `schemastore.nvim`
- `dotenv.nvim`
- `fidget.nvim`

Generic LSP servers are configured separately from language-specific plugins like Rust and Java.

### Treesitter

- `nvim-treesitter`
- `nvim-treesitter-context`
- `nvim-treesitter-textobjects`

Used for syntax highlighting, code context, textobjects, and structural navigation.

### Git

- `lazygit.nvim`
- `gitsigns.nvim`
- `diffview.nvim`
- `advanced-git-search.nvim`
- `vim-fugitive`
- `vim-rhubarb`

### Search

- `telescope.nvim`
- `telescope-fzf-native.nvim`
- `project.nvim`

### Editor

- `oil.nvim`
- `mini.nvim`
- `conform.nvim`
- `none-ls.nvim`
- `nvim-ufo`
- `hlchunk.nvim`
- `hardtime.nvim`
- `suda.vim`

### UI

- `noirbuddy`
- `noice.nvim`
- `nvim-notify`
- `fidget.nvim`
- `bufferline.nvim`
- `lualine.nvim`
- `incline.nvim`
- `trouble.nvim`
- `which-key.nvim`

### Productivity

- `neogen`
- `refactoring.nvim`
- `dial.nvim`
- `mini.bracketed`
- `symbols-outline.nvim`
- `todo-comments.nvim`
- `persisted.nvim`
- `markdown-preview.nvim`
- `render-markdown.nvim`

### Web / API Tools

- `kulala.nvim`
- `live-server.nvim`
- `cloak.nvim`
- `nvim-ts-autotag`

---

## Language Support

### Rust

Rust is one of the main focuses of this setup.

Features:

- `rust-analyzer` via `rustup`
- `clippy` on check
- `rustfmt` formatting
- `rustaceanvim` commands
- macro expansion
- error explanation
- runnable/testable/debuggable discovery
- DAP through `codelldb`
- Treesitter and LSP semantic highlighting

Useful commands:

```vim
:RustLsp runnables
:RustLsp testables
:RustLsp debuggables
:RustLsp explainError
:RustLsp renderDiagnostic
:RustLsp expandMacro
```

### Java

Java support is powered by `nvim-java` and JDTLS.

Features:

- JDTLS integration
- Java test support
- Java DAP support
- code actions
- extract method through LSP code actions when supported by JDTLS

### TypeScript / JavaScript

TypeScript support is handled through `typescript-tools.nvim`, while Angular has its own LSP configuration.

Features:

- TS/JS LSP
- inlay hints
- code actions
- DAP via `js-debug-adapter`
- browser debugging
- Node debugging
- Jest debugging

### Flutter / Dart

Flutter support is powered by `flutter-tools.nvim`.

Features:

- Flutter run
- hot reload
- hot restart
- devices
- emulators
- outline
- DevTools
- DAP integration

### Python

Python debugging is provided by `debugpy`, with formatting through `ruff`.

### Go

Go debugging is available through `nvim-dap-go`.

---

## Keymaps

Leader key:

```text
Space
```

The following list focuses on custom and plugin-specific mappings, excluding most default Neovim mappings.

---

## General Editing

| Key          | Action                    |
| ------------ | ------------------------- |
| `<C-s>`      | Save file                 |
| `<leader>sn` | Save without formatting   |
| `<leader>cS` | Source current file       |
| `<leader>lw` | Toggle line wrap          |
| `<leader>x`  | `chmod +x` current file   |
| `<leader>va` | Select all                |
| `<leader>s`  | Replace word under cursor |
| `=ap`        | Reindent paragraph        |
| `+`          | Increment number          |
| `-`          | Decrement number          |
| `<M-o>`      | Add blank line below      |
| `<M-O>`      | Add blank line above      |
| `<leader>o`  | Add line below            |
| `<leader>O`  | Add line above            |

---

## Clipboard / Register Helpers

| Key         | Action                          |
| ----------- | ------------------------------- |
| `<leader>y` | Yank to system clipboard        |
| `<leader>Y` | Yank line to system clipboard   |
| `<leader>p` | Paste from yank register        |
| `<leader>P` | Paste before from yank register |
| `<leader>d` | Delete without yanking          |
| `<leader>D` | Delete line without yanking     |
| `<leader>c` | Change without yanking          |
| `<leader>C` | Change line without yanking     |

---

## Window and Buffer Navigation

| Key          | Action                     |
| ------------ | -------------------------- |
| `<Tab>`      | Next buffer                |
| `<S-Tab>`    | Previous buffer            |
| `<leader>bd` | Close buffer               |
| `<leader>bn` | New buffer                 |
| `<leader>bh` | Close buffers to the left  |
| `<leader>bl` | Close buffers to the right |
| `<leader>bo` | Close all other buffers    |
| `<leader>q`  | Close buffer               |
| `ss`         | Horizontal split           |
| `sv`         | Vertical split             |
| `<leader>wh` | Move to left window        |
| `<leader>wj` | Move to lower window       |
| `<leader>wk` | Move to upper window       |
| `<leader>wl` | Move to right window       |
| `<Up>`       | Resize window up           |
| `<Down>`     | Resize window down         |
| `<Left>`     | Resize window left         |
| `<Right>`    | Resize window right        |

---

## Telescope / Search

| Key                | Action                 |
| ------------------ | ---------------------- |
| `<leader><leader>` | Find files             |
| `<leader>ff`       | Find files             |
| `<leader>fr`       | Recent files           |
| `<leader>fg`       | Git files              |
| `<leader>/`        | Live grep              |
| `<leader>fw`       | Grep word under cursor |
| `<leader>fb`       | Open buffers           |
| `<leader>fd`       | Diagnostics            |
| `<leader>fD`       | LSP definitions        |
| `<leader>fi`       | LSP implementations    |
| `<leader>ft`       | LSP type definitions   |
| `<leader>fs`       | Document symbols       |
| `<leader>fS`       | Workspace symbols      |
| `<leader>fh`       | Help tags              |
| `<leader>fk`       | Keymaps                |
| `<leader>fc`       | Commands               |
| `<leader>f:`       | Command history        |
| `<leader>fp`       | Find projects          |

---

## LSP

| Key           | Action                         |
| ------------- | ------------------------------ |
| `gd`          | Go to definition               |
| `gD`          | Go to declaration              |
| `gi`          | Go to implementation           |
| `gr`          | References                     |
| `gt`          | Go to type definition          |
| `<A-k>`       | Hover docs                     |
| `<leader>k`   | Signature help                 |
| `<leader>rn`  | Rename symbol                  |
| `<leader>ca`  | Code action                    |
| `<leader>dl`  | Diagnostic float               |
| `<C-j>`       | Next diagnostic                |
| `<C-k>`       | Previous diagnostic            |
| `<leader>zig` | Restart LSP                    |
| `<leader>vv`  | Toggle diagnostic virtual text |
| `<leader>vi`  | Toggle inlay hints             |

---

## Rust

| Key          | Action                 |
| ------------ | ---------------------- |
| `<leader>Rr` | Rust runnables         |
| `<leader>Rt` | Rust testables         |
| `<leader>Rd` | Rust debuggables       |
| `<leader>Re` | Explain Rust error     |
| `<leader>RD` | Render Rust diagnostic |
| `<leader>Rm` | Expand Rust macro      |

---

## Debugging

| Key           | Action                 |
| ------------- | ---------------------- |
| `<leader>dc`  | Continue               |
| `<leader>dso` | Step over              |
| `<leader>dsi` | Step into              |
| `<leader>dsu` | Step out               |
| `<leader>db`  | Toggle breakpoint      |
| `<leader>dB`  | Conditional breakpoint |
| `<leader>dl`  | Log point              |
| `<leader>du`  | Toggle DAP UI          |
| `<leader>de`  | Eval expression        |
| `<leader>dr`  | Open REPL              |
| `<leader>dq`  | Terminate              |
| `<leader>dC`  | Clear all breakpoints  |

---

## Git

| Key           | Action                      |
| ------------- | --------------------------- |
| `<leader>lg`  | LazyGit                     |
| `<leader>lf`  | LazyGit filter              |
| `<leader>lF`  | LazyGit filter current file |
| `<leader>lc`  | LazyGit config              |
| `<leader>ga`  | Advanced Git Search         |
| `<leader>gdo` | Diffview open               |
| `<leader>gdc` | Diffview close              |
| `<leader>gdh` | File history                |
| `<leader>gdH` | Branch history              |
| `<leader>gb`  | Git blame line              |
| `<leader>gB`  | Toggle blame                |
| `<leader>gd`  | Git diff this               |
| `<leader>gp`  | Preview hunk                |
| `<leader>gr`  | Reset hunk                  |
| `<leader>gR`  | Reset buffer                |
| `<leader>gs`  | Stage hunk                  |
| `<leader>gS`  | Stage buffer                |
| `<leader>gu`  | Undo stage hunk             |
| `]h`          | Next hunk                   |
| `[h`          | Previous hunk               |

---

## Harpoon

| Key          | Action                |
| ------------ | --------------------- |
| `<leader>ha` | Add file              |
| `<leader>hh` | Toggle Harpoon menu   |
| `<leader>hn` | Next Harpoon file     |
| `<leader>hp` | Previous Harpoon file |
| `<leader>1`  | Harpoon file 1        |
| `<leader>2`  | Harpoon file 2        |
| `<leader>3`  | Harpoon file 3        |
| `<leader>4`  | Harpoon file 4        |
| `<leader>5`  | Harpoon file 5        |

---

## Oil File Explorer

| Key         | Action                         |
| ----------- | ------------------------------ |
| `<leader>e` | Open parent directory          |
| `<leader>E` | Open current working directory |

Inside Oil:

| Key           | Action                   |
| ------------- | ------------------------ |
| `<CR>` / `l`  | Open/select              |
| `h` / `-`     | Parent directory         |
| `.`           | Toggle hidden files      |
| `<C-p>`       | Preview                  |
| `<C-s>`       | Open in horizontal split |
| `<C-v>`       | Open in vertical split   |
| `<C-t>`       | Open in tab              |
| `q` / `<C-c>` | Close                    |

---

## AI

### Avante

| Key          | Action               |
| ------------ | -------------------- |
| `<leader>aa` | Ask                  |
| `<leader>an` | New ask              |
| `<leader>ae` | Edit selected code   |
| `<leader>az` | Toggle Zen Mode      |
| `<leader>at` | Toggle Avante        |
| `<leader>af` | Focus Avante         |
| `<leader>ar` | Refresh              |
| `<leader>aS` | Stop                 |
| `<leader>as` | Toggle suggestion    |
| `<leader>aR` | Display repo map     |
| `<leader>a?` | Select model         |
| `<leader>ah` | Select history       |
| `<leader>aB` | Add all open buffers |

### OpenCode

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>oa` | Ask about current context |
| `<leader>oA` | Ask                       |
| `<leader>os` | Select action             |
| `<leader>ot` | Toggle OpenCode           |
| `<leader>oo` | Add range                 |
| `<leader>ol` | Add line                  |
| `<leader>ou` | Scroll up                 |
| `<leader>od` | Scroll down               |

---

## Refactoring

| Key          | Mode          | Action                   |
| ------------ | ------------- | ------------------------ |
| `<leader>re` | Visual        | Extract function         |
| `<leader>rf` | Visual        | Extract function to file |
| `<leader>rv` | Visual        | Extract variable         |
| `<leader>ri` | Normal/Visual | Inline variable          |
| `<leader>rI` | Normal        | Inline function          |
| `<leader>rb` | Normal        | Extract block            |
| `<leader>rB` | Normal        | Extract block to file    |

---

## Productivity

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>cn` | Generate docstring        |
| `<leader>cf` | Format buffer             |
| `<leader>cs` | Symbols outline           |
| `<leader>u`  | Toggle Undotree           |
| `<leader>ut` | Toggle Treesitter context |
| `<leader>uH` | Toggle Hardtime           |
| `<leader>z`  | Toggle Zen Mode           |
| `<leader>mp` | Markdown preview          |
| `<leader>ss` | Save session              |
| `<leader>sl` | Load session              |
| `<leader>sd` | Delete session            |
| `<leader>td` | Todo Trouble              |
| `<leader>tf` | Todo Telescope            |

---

## HTTP / REST

Powered by `kulala.nvim`.

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>Hr` | Run request      |
| `<leader>Ha` | Run all requests |
| `<leader>Hp` | Previous request |
| `<leader>Hn` | Next request     |
| `<leader>Hc` | Copy as cURL     |
| `<leader>Hi` | Inspect request  |

---

## Flutter

| Key          | Action       |
| ------------ | ------------ |
| `<leader>Fr` | Flutter run  |
| `<leader>Fq` | Flutter quit |
| `<leader>FR` | Hot reload   |
| `<leader>FS` | Hot restart  |
| `<leader>Fd` | Devices      |
| `<leader>Fe` | Emulators    |
| `<leader>Fo` | Outline      |
| `<leader>Fl` | DevTools     |
| `<leader>Fc` | Clear log    |

---

## Trouble

| Key          | Action                     |
| ------------ | -------------------------- |
| `<leader>tx` | Diagnostics                |
| `<leader>tX` | Buffer diagnostics         |
| `<leader>ts` | Symbols                    |
| `<leader>tl` | LSP references/definitions |
| `<leader>tL` | Location list              |
| `<leader>tQ` | Quickfix list              |

---

## Sudo Editing

Powered by `suda.vim`.

| Key          | Action        |
| ------------ | ------------- |
| `<leader>uw` | Write as sudo |
| `<leader>ur` | Read as sudo  |

---

## Live Server

| Key          | Action            |
| ------------ | ----------------- |
| `<leader>Ls` | Start Live Server |
| `<leader>Lq` | Stop Live Server  |

---

## Flash Navigation

| Key  | Action            |
| ---- | ----------------- |
| `zk` | Flash jump        |
| `Zk` | Flash Treesitter  |
| `Zr` | Remote flash      |
| `ZR` | Treesitter search |

---

## Treesitter and Movement

| Key         | Action                        |
| ----------- | ----------------------------- |
| `[n` / `]n` | Previous/next Treesitter item |
| `[d` / `]d` | Previous/next diagnostic      |
| `[b` / `]b` | Previous/next buffer          |
| `[c` / `]c` | Previous/next comment         |
| `[x` / `]x` | Previous/next conflict        |
| `[i` / `]i` | Previous/next indent          |
| `[u` / `]u` | Previous/next undo state      |
| `<M-h>`     | Move line/selection left      |
| `<M-j>`     | Move line/selection down      |
| `<M-k>`     | Move line/selection up        |
| `<M-l>`     | Move line/selection right     |

---

## Folding

Powered by `nvim-ufo`.

| Key  | Action          |
| ---- | --------------- |
| `zR` | Open all folds  |
| `zM` | Close all folds |

---

## Formatting

Formatting is handled by `conform.nvim`.

Configured formatters include:

| Filetype                | Formatter               |
| ----------------------- | ----------------------- |
| JavaScript / TypeScript | `prettierd`, `prettier` |
| React / TSX / JSX       | `prettierd`, `prettier` |
| HTML / CSS / SCSS       | `prettierd`, `prettier` |
| JSON / YAML / Markdown  | `prettierd`, `prettier` |
| Lua                     | `stylua`                |
| Shell                   | `shfmt`                 |
| Fish                    | `fish_indent`           |
| Python                  | `ruff_format`           |
| Rust                    | `rustfmt`               |
| Java                    | LSP formatting          |
| Kotlin                  | LSP formatting          |
| Dart                    | `dart_format`           |

Manual format:

```vim
<leader>cf
```

---

## Debug Adapter Support

| Language                | Adapter                       |
| ----------------------- | ----------------------------- |
| Rust / C / C++          | `codelldb`                    |
| JavaScript / TypeScript | `js-debug-adapter`            |
| Python                  | `debugpy`                     |
| Go                      | `delve` through `nvim-dap-go` |
| PHP                     | `php-debug-adapter`           |
| Lua                     | `nlua` attach                 |
| Dart / Flutter          | Dart / Flutter debug adapter  |

---

## LSP Servers

Generic LSP servers are configured under `lua/core/lsp/servers.lua`.

Configured servers include:

- Angular
- Lua
- JSON
- CSS
- Docker
- Docker Compose
- HTML
- Kotlin
- Markdown
- Python
- TailwindCSS

Rust and Java are intentionally handled separately:

- Rust: `rustaceanvim`
- Java: `nvim-java`

This avoids duplicate LSP clients and keeps language-specific behavior isolated.

---

## Mason Tools

Common Mason-managed tools include:

- `angular-language-server`
- `codelldb`
- `debugpy`
- `docker-compose-language-service`
- `dockerfile-language-server`
- `google-java-format`
- `hadolint`
- `js-debug-adapter`
- `json-lsp`
- `kotlin-language-server`
- `ktlint`
- `lua-language-server`
- `markdownlint-cli2`
- `marksman`
- `php-debug-adapter`
- `prettier`
- `prettierd`
- `ruff`
- `shfmt`
- `stylua`

Rust tools are managed by `rustup`, not Mason.

---

## Recommended Health Checks

```vim
:checkhealth
:Lazy
:Mason
:LspInfo
:ConformInfo
```

Rust-specific:

```vim
:RustLsp runnables
:RustLsp testables
:RustLsp debuggables
```

DAP:

```vim
:checkhealth dap
```

Treesitter:

```vim
:checkhealth nvim-treesitter
```

---

## Troubleshooting

### Rust analyzer is not found

Check:

```bash
which rust-analyzer
rust-analyzer --version
```

If it is missing:

```bash
rustup component add rust-analyzer rust-src clippy rustfmt
```

### Rust LSP behaves strangely

Make sure `rust_analyzer` is not installed/configured through Mason LSP. Rust should be handled by `rustaceanvim`.

### DAP keymaps do not work

Check:

```vim
:Lazy
```

Then verify that `nvim-dap`, `nvim-dap-ui`, and the required adapter are installed through Mason.

### Treesitter parser errors

Run:

```vim
:TSUpdate
:checkhealth nvim-treesitter
```

### No icons

Install a Nerd Font and configure your terminal to use it.

---

## Design Notes

This setup intentionally separates responsibilities:

| Layer         | Responsibility                                 |
| ------------- | ---------------------------------------------- |
| `lua/config`  | editor options, keymaps, diagnostics, autocmds |
| `lua/plugins` | Lazy.nvim plugin specs                         |
| `lua/core`    | reusable Lua modules used by plugin specs      |

This avoids a common Neovim problem: plugin specs becoming too large and mixing runtime logic, keymaps, adapters, and configuration in one place.

---

## Credits

Built with inspiration from:

- LazyVim
- ThePrimeagen
- TJ DeVries
- The Neovim community
- Rustaceanvim
- Folke's Neovim ecosystem

---

## License

Use, modify, fork, break, fix, and improve freely.

```

```
