# Neovim Keymaps

| Mode | Key | Description | Command |
|---|---|---|---|
| VISUAL | `<Tab>` | vim.snippet.jump if active, otherwise <Tab> | `` |
| VISUAL | ` de` | DAP: Eval expression | `` |
| VISUAL | ` rv` | Extract variable | `` |
| VISUAL | ` rf` | Extract function to file | `` |
| VISUAL | ` re` | Extract function | `` |
| VISUAL | ` ri` | Inline variable | `` |
| VISUAL | ` ae` | avante: edit | `` |
| VISUAL | ` an` | avante: create new ask | `` |
| VISUAL | ` az` | avante: toggle Zen Mode | `` |
| VISUAL | ` aa` | avante: ask | `` |
| VISUAL | ` y` | Yank to system clipboard | `"+y` |
| VISUAL | ` p` | Paste without replacing register | `"_dP` |
| VISUAL | ` C` | Change line without yanking | `"_C` |
| VISUAL | ` c` | Change without yanking | `"_c` |
| VISUAL | ` D` | Delete line without yanking | `"_D` |
| VISUAL | ` d` | Delete without yanking | `"_d` |
| VISUAL | `#` | :help v_#-default | `` |
| VISUAL | `*` | :help v_star-default | `` |
| VISUAL | `@` | :help v_@-default | `mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@'` |
| VISUAL | `J` | Move selection down | `:m '>+1<CR>gv=gv` |
| VISUAL | `K` | Move selection up | `:m '<lt>-2<CR>gv=gv` |
| VISUAL | `Q` | :help v_Q-default | `mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'` |
| VISUAL | `ZR` | Treesitter search | `` |
| VISUAL | `Zk` | Flash treesitter | `` |
| VISUAL | `[N` | Treesitter first | `<Cmd>lua MiniBracketed.treesitter('first')<CR>` |
| VISUAL | `[i` | Indent backward | `<Cmd>lua MiniBracketed.indent('backward')<CR>` |
| VISUAL | `[I` | Indent first | `<Cmd>lua MiniBracketed.indent('first')<CR>` |
| VISUAL | `[d` | Diagnostic backward | `<Cmd>lua MiniBracketed.diagnostic('backward')<CR>` |
| VISUAL | `[D` | Diagnostic first | `<Cmd>lua MiniBracketed.diagnostic('first')<CR>` |
| VISUAL | `[x` | Conflict backward | `<Cmd>lua MiniBracketed.conflict('backward')<CR>` |
| VISUAL | `[X` | Conflict first | `<Cmd>lua MiniBracketed.conflict('first')<CR>` |
| VISUAL | `[c` | Comment backward | `<Cmd>lua MiniBracketed.comment('backward')<CR>` |
| VISUAL | `[C` | Comment first | `<Cmd>lua MiniBracketed.comment('first')<CR>` |
| VISUAL | `[n` | Treesitter backward | `<Cmd>lua MiniBracketed.treesitter('backward')<CR>` |
| VISUAL | `]N` | Treesitter last | `<Cmd>lua MiniBracketed.treesitter('last')<CR>` |
| VISUAL | `]i` | Indent forward | `<Cmd>lua MiniBracketed.indent('forward')<CR>` |
| VISUAL | `]I` | Indent last | `<Cmd>lua MiniBracketed.indent('last')<CR>` |
| VISUAL | `]d` | Diagnostic forward | `<Cmd>lua MiniBracketed.diagnostic('forward')<CR>` |
| VISUAL | `]D` | Diagnostic last | `<Cmd>lua MiniBracketed.diagnostic('last')<CR>` |
| VISUAL | `]x` | Conflict forward | `<Cmd>lua MiniBracketed.conflict('forward')<CR>` |
| VISUAL | `]X` | Conflict last | `<Cmd>lua MiniBracketed.conflict('last')<CR>` |
| VISUAL | `]c` | Comment forward | `<Cmd>lua MiniBracketed.comment('forward')<CR>` |
| VISUAL | `]C` | Comment last | `<Cmd>lua MiniBracketed.comment('last')<CR>` |
| VISUAL | `]n` | Treesitter forward | `<Cmd>lua MiniBracketed.treesitter('forward')<CR>` |
| VISUAL | `al` | Around last textobject | `` |
| VISUAL | `a` | Around textobject | `` |
| VISUAL | `an` | Around next textobject | `` |
| VISUAL | `g]` | Move to right "around" | `` |
| VISUAL | `g[` | Move to left "around" | `` |
| VISUAL | `gra` | vim.lsp.buf.code_action() | `` |
| VISUAL | `gc` | Toggle comment | `` |
| VISUAL | `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) | `` |
| VISUAL | `il` | Inside last textobject | `` |
| VISUAL | `i` | Inside textobject | `` |
| VISUAL | `in` | Inside next textobject | `` |
| VISUAL | `sFn` | Find next left surrounding | `` |
| VISUAL | `sFl` | Find previous left surrounding | `` |
| VISUAL | `sF` | Find left surrounding | `` |
| VISUAL | `sfn` | Find next right surrounding | `` |
| VISUAL | `sfl` | Find previous right surrounding | `` |
| VISUAL | `sf` | Find right surrounding | `` |
| VISUAL | `sa` | Add surrounding to selection | `:<C-U>lua MiniSurround.add("visual")<CR>` |
| VISUAL | `zk` | Flash jump | `` |
| VISUAL | `<M-k>` | Move up | `<Cmd>lua MiniMove.move_selection('up')<CR>` |
| VISUAL | `<M-j>` | Move down | `<Cmd>lua MiniMove.move_selection('down')<CR>` |
| VISUAL | `<M-l>` | Move right | `<Cmd>lua MiniMove.move_selection('right')<CR>` |
| VISUAL | `<M-h>` | Move left | `<Cmd>lua MiniMove.move_selection('left')<CR>` |
| VISUAL | `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> | `` |
| VISUAL | `<C-S>` | vim.lsp.buf.signature_help() | `` |
| INSERT | `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> | `` |
| INSERT | `<C-S>` | vim.lsp.buf.signature_help() | `` |
| INSERT | `<C-W>` | :help i_CTRL-W-default | `<C-G>u<C-W>` |
| INSERT | `<C-U>` | :help i_CTRL-U-default | `<C-G>u<C-U>` |
| INSERT | `<Tab>` | vim.snippet.jump if active, otherwise <Tab> | `` |
| VISUAL BLOCK | ` de` | DAP: Eval expression | `` |
| VISUAL BLOCK | ` rv` | Extract variable | `` |
| VISUAL BLOCK | ` rf` | Extract function to file | `` |
| VISUAL BLOCK | ` re` | Extract function | `` |
| VISUAL BLOCK | ` ri` | Inline variable | `` |
| VISUAL BLOCK | ` ae` | avante: edit | `` |
| VISUAL BLOCK | ` an` | avante: create new ask | `` |
| VISUAL BLOCK | ` az` | avante: toggle Zen Mode | `` |
| VISUAL BLOCK | ` aa` | avante: ask | `` |
| VISUAL BLOCK | ` y` | Yank to system clipboard | `"+y` |
| VISUAL BLOCK | ` p` | Paste without replacing register | `"_dP` |
| VISUAL BLOCK | ` C` | Change line without yanking | `"_C` |
| VISUAL BLOCK | ` c` | Change without yanking | `"_c` |
| VISUAL BLOCK | ` D` | Delete line without yanking | `"_D` |
| VISUAL BLOCK | ` d` | Delete without yanking | `"_d` |
| VISUAL BLOCK | `#` | :help v_#-default | `` |
| VISUAL BLOCK | `*` | :help v_star-default | `` |
| VISUAL BLOCK | `@` | :help v_@-default | `mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@'` |
| VISUAL BLOCK | `J` | Move selection down | `:m '>+1<CR>gv=gv` |
| VISUAL BLOCK | `K` | Move selection up | `:m '<lt>-2<CR>gv=gv` |
| VISUAL BLOCK | `Q` | :help v_Q-default | `mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'` |
| VISUAL BLOCK | `ZR` | Treesitter search | `` |
| VISUAL BLOCK | `Zk` | Flash treesitter | `` |
| VISUAL BLOCK | `[N` | Treesitter first | `<Cmd>lua MiniBracketed.treesitter('first')<CR>` |
| VISUAL BLOCK | `[i` | Indent backward | `<Cmd>lua MiniBracketed.indent('backward')<CR>` |
| VISUAL BLOCK | `[I` | Indent first | `<Cmd>lua MiniBracketed.indent('first')<CR>` |
| VISUAL BLOCK | `[d` | Diagnostic backward | `<Cmd>lua MiniBracketed.diagnostic('backward')<CR>` |
| VISUAL BLOCK | `[D` | Diagnostic first | `<Cmd>lua MiniBracketed.diagnostic('first')<CR>` |
| VISUAL BLOCK | `[x` | Conflict backward | `<Cmd>lua MiniBracketed.conflict('backward')<CR>` |
| VISUAL BLOCK | `[X` | Conflict first | `<Cmd>lua MiniBracketed.conflict('first')<CR>` |
| VISUAL BLOCK | `[c` | Comment backward | `<Cmd>lua MiniBracketed.comment('backward')<CR>` |
| VISUAL BLOCK | `[C` | Comment first | `<Cmd>lua MiniBracketed.comment('first')<CR>` |
| VISUAL BLOCK | `[n` | Treesitter backward | `<Cmd>lua MiniBracketed.treesitter('backward')<CR>` |
| VISUAL BLOCK | `]N` | Treesitter last | `<Cmd>lua MiniBracketed.treesitter('last')<CR>` |
| VISUAL BLOCK | `]i` | Indent forward | `<Cmd>lua MiniBracketed.indent('forward')<CR>` |
| VISUAL BLOCK | `]I` | Indent last | `<Cmd>lua MiniBracketed.indent('last')<CR>` |
| VISUAL BLOCK | `]d` | Diagnostic forward | `<Cmd>lua MiniBracketed.diagnostic('forward')<CR>` |
| VISUAL BLOCK | `]D` | Diagnostic last | `<Cmd>lua MiniBracketed.diagnostic('last')<CR>` |
| VISUAL BLOCK | `]x` | Conflict forward | `<Cmd>lua MiniBracketed.conflict('forward')<CR>` |
| VISUAL BLOCK | `]X` | Conflict last | `<Cmd>lua MiniBracketed.conflict('last')<CR>` |
| VISUAL BLOCK | `]c` | Comment forward | `<Cmd>lua MiniBracketed.comment('forward')<CR>` |
| VISUAL BLOCK | `]C` | Comment last | `<Cmd>lua MiniBracketed.comment('last')<CR>` |
| VISUAL BLOCK | `]n` | Treesitter forward | `<Cmd>lua MiniBracketed.treesitter('forward')<CR>` |
| VISUAL BLOCK | `al` | Around last textobject | `` |
| VISUAL BLOCK | `a` | Around textobject | `` |
| VISUAL BLOCK | `an` | Around next textobject | `` |
| VISUAL BLOCK | `g]` | Move to right "around" | `` |
| VISUAL BLOCK | `g[` | Move to left "around" | `` |
| VISUAL BLOCK | `gra` | vim.lsp.buf.code_action() | `` |
| VISUAL BLOCK | `gc` | Toggle comment | `` |
| VISUAL BLOCK | `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) | `` |
| VISUAL BLOCK | `il` | Inside last textobject | `` |
| VISUAL BLOCK | `i` | Inside textobject | `` |
| VISUAL BLOCK | `in` | Inside next textobject | `` |
| VISUAL BLOCK | `sFn` | Find next left surrounding | `` |
| VISUAL BLOCK | `sFl` | Find previous left surrounding | `` |
| VISUAL BLOCK | `sF` | Find left surrounding | `` |
| VISUAL BLOCK | `sfn` | Find next right surrounding | `` |
| VISUAL BLOCK | `sfl` | Find previous right surrounding | `` |
| VISUAL BLOCK | `sf` | Find right surrounding | `` |
| VISUAL BLOCK | `sa` | Add surrounding to selection | `:<C-U>lua MiniSurround.add("visual")<CR>` |
| VISUAL BLOCK | `zk` | Flash jump | `` |
| VISUAL BLOCK | `<M-k>` | Move up | `<Cmd>lua MiniMove.move_selection('up')<CR>` |
| VISUAL BLOCK | `<M-j>` | Move down | `<Cmd>lua MiniMove.move_selection('down')<CR>` |
| VISUAL BLOCK | `<M-l>` | Move right | `<Cmd>lua MiniMove.move_selection('right')<CR>` |
| VISUAL BLOCK | `<M-h>` | Move left | `<Cmd>lua MiniMove.move_selection('left')<CR>` |
| NORMAL | `<Tab>` | Next buffer | `<Cmd>BufferLineCycleNext<CR>` |
| NORMAL | ` tf` | Todo Telescope | `<Cmd>TodoTelescope<CR>` |
| NORMAL | ` td` | Todo Trouble | `<Cmd>TodoTrouble<CR>` |
| NORMAL | ` ut` | Toggle Treesitter context | `` |
| NORMAL | ` sl` | Session load | `<Cmd>SessionLoad<CR>` |
| NORMAL | ` ss` | Session save | `<Cmd>SessionSave<CR>` |
| NORMAL | ` sd` | Session delete | `<Cmd>SessionDelete<CR>` |
| NORMAL | ` dC` | DAP: Clear all breakpoints | `` |
| NORMAL | ` dq` | DAP: Terminate | `` |
| NORMAL | ` dr` | DAP: Open REPL | `` |
| NORMAL | ` de` | DAP: Eval expression | `` |
| NORMAL | ` du` | DAP: Toggle UI | `` |
| NORMAL | ` dl` | DAP: Log point | `` |
| NORMAL | ` dB` | DAP: Conditional breakpoint | `` |
| NORMAL | ` db` | DAP: Toggle breakpoint | `` |
| NORMAL | ` dsu` | DAP: Step out | `` |
| NORMAL | ` dsi` | DAP: Step into | `` |
| NORMAL | ` dso` | DAP: Step over | `` |
| NORMAL | ` dc` | DAP: Continue | `` |
| NORMAL | ` ri` | Inline variable | `` |
| NORMAL | ` rb` | Extract block | `` |
| NORMAL | ` rB` | Extract block to file | `` |
| NORMAL | ` rI` | Inline function | `` |
| NORMAL | ` aB` | avante: add all open buffers | `` |
| NORMAL | ` am` | avante: select ACP mode | `` |
| NORMAL | ` aM` | avante: select ACP model | `` |
| NORMAL | ` ah` | avante: select history | `` |
| NORMAL | ` a?` | avante: select model | `` |
| NORMAL | ` aR` | avante: display repo map | `` |
| NORMAL | ` as` | avante: toggle suggestion | `` |
| NORMAL | ` aC` | avante: toggle selection | `` |
| NORMAL | ` ad` | avante: toggle debug | `` |
| NORMAL | ` at` | avante: toggle | `` |
| NORMAL | ` af` | avante: focus | `` |
| NORMAL | ` ar` | avante: refresh | `` |
| NORMAL | ` aS` | avante: stop | `` |
| NORMAL | ` an` | avante: create new ask | `` |
| NORMAL | ` az` | avante: toggle Zen Mode | `` |
| NORMAL | ` aa` | avante: ask | `` |
| NORMAL | ` cc` | Convert color | `<Cmd>CccConvert<CR>` |
| NORMAL | ` cp` | Color picker | `<Cmd>CccPick<CR>` |
| NORMAL | ` fc` | Commands | `` |
| NORMAL | ` fk` | Keymaps | `` |
| NORMAL | ` fh` | Help tags | `` |
| NORMAL | ` fS` | Workspace symbols | `` |
| NORMAL | ` fs` | Document symbols | `` |
| NORMAL | ` ft` | LSP type definitions | `` |
| NORMAL | ` fi` | LSP implementations | `` |
| NORMAL | ` fD` | LSP definitions | `` |
| NORMAL | ` fd` | Diagnostics | `` |
| NORMAL | ` fb` | Open buffers | `` |
| NORMAL | ` fw` | Grep word under cursor | `` |
| NORMAL | ` /` | Live grep | `` |
| NORMAL | ` fg` | Git files | `` |
| NORMAL | ` fr` | Recent files | `` |
| NORMAL | ` ff` | Find files | `` |
| NORMAL | ` f:` | Command history | `` |
| NORMAL | `  ` | Find files | `` |
| NORMAL | ` fp` | Find projects | `<Cmd>Telescope projects<CR>` |
| NORMAL | ` vi` | Toggle inlay hints | `` |
| NORMAL | ` vv` | Toggle diagnostic virtual text | `` |
| NORMAL | ` 5` | Harpoon: File 5 | `` |
| NORMAL | ` 4` | Harpoon: File 4 | `` |
| NORMAL | ` 3` | Harpoon: File 3 | `` |
| NORMAL | ` 2` | Harpoon: File 2 | `` |
| NORMAL | ` 1` | Harpoon: File 1 | `` |
| NORMAL | ` hp` | Harpoon: Previous file | `` |
| NORMAL | ` hn` | Harpoon: Next file | `` |
| NORMAL | ` hh` | Harpoon: Toggle menu | `` |
| NORMAL | ` ha` | Harpoon: Add file | `` |
| NORMAL | ` E` | Oil: Open cwd | `` |
| NORMAL | ` e` | Oil: Open parent directory | `` |
| NORMAL | ` cn` | Generate docstring | `` |
| NORMAL | ` ga` | Git: Advanced search | `` |
| NORMAL | ` gdo` | Git: Diffview open | `` |
| NORMAL | ` gdH` | Git: Branch history | `` |
| NORMAL | ` gdh` | Git: File history | `` |
| NORMAL | ` gdc` | Git: Diffview close | `` |
| NORMAL | ` Hi` | HTTP: Inspect request | `` |
| NORMAL | ` Hc` | HTTP: Copy as cURL | `` |
| NORMAL | ` Hn` | HTTP: Next request | `` |
| NORMAL | ` Hp` | HTTP: Previous request | `` |
| NORMAL | ` Ha` | HTTP: Run all requests | `` |
| NORMAL | ` Hr` | HTTP: Run request | `` |
| NORMAL | ` lf` | LazyGit filter | `` |
| NORMAL | ` lg` | LazyGit | `<Cmd>LazyGit<CR>` |
| NORMAL | ` lc` | LazyGit config | `` |
| NORMAL | ` lF` | LazyGit filter current file | `` |
| NORMAL | ` Fr` | Flutter: Run | `` |
| NORMAL | ` Fc` | Flutter: Clear log | `` |
| NORMAL | ` Fl` | Flutter: DevTools | `` |
| NORMAL | ` Fo` | Flutter: Outline | `` |
| NORMAL | ` Fe` | Flutter: Emulators | `` |
| NORMAL | ` Fd` | Flutter: Devices | `` |
| NORMAL | ` FS` | Flutter: Hot restart | `` |
| NORMAL | ` FR` | Flutter: Hot reload | `` |
| NORMAL | ` Fq` | Flutter: Quit | `` |
| NORMAL | ` uH` | Toggle Hardtime | `` |
| NORMAL | ` Ls` | Live Server: Start | `` |
| NORMAL | ` Lq` | Live Server: Stop | `` |
| NORMAL | ` ts` | Symbols | `` |
| NORMAL | ` tl` | LSP references/definitions | `` |
| NORMAL | ` tx` | Diagnostics | `` |
| NORMAL | ` tX` | Buffer diagnostics | `` |
| NORMAL | ` tL` | Location list | `` |
| NORMAL | ` tQ` | Quickfix list | `` |
| NORMAL | ` uw` | Suda: Write as sudo | `` |
| NORMAL | ` ur` | Suda: Read as sudo | `` |
| NORMAL | ` cs` | Symbols outline | `` |
| NORMAL | ` sw` | Search current word | `` |
| NORMAL | ` sr` | Search and replace | `` |
| NORMAL | ` z` | Toggle Zen Mode | `` |
| NORMAL | ` u` | Toggle Undotree | `` |
| NORMAL | ` cf` | Format buffer | `` |
| NORMAL | ` mp` | Markdown: Preview | `` |
| NORMAL | ` bo` | Close all other buffers | `` |
| NORMAL | ` bl` | Close buffers to the right | `` |
| NORMAL | ` bh` | Close buffers to the left | `` |
| NORMAL | ` bn` | New buffer | `<Cmd>enew<CR>` |
| NORMAL | ` bd` | Close buffer | `` |
| NORMAL | ` q` | Close buffer | `<Cmd>bd<CR>` |
| NORMAL | ` wl` | Move to right window | `<C-W>l` |
| NORMAL | ` wk` | Move to upper window | `<C-W>k` |
| NORMAL | ` wj` | Move to lower window | `<C-W>j` |
| NORMAL | ` wh` | Move to left window | `<C-W>h` |
| NORMAL | ` cS` | Source current file | `<Cmd>source %<CR>` |
| NORMAL | ` x` | chmod +x current file | `<Cmd>silent !chmod +x %<CR>` |
| NORMAL | ` lw` | Toggle line wrap | `<Cmd>set wrap!<CR>` |
| NORMAL | ` O` | Add line above | `O<Esc>` |
| NORMAL | ` o` | Add line below | `o<Esc>` |
| NORMAL | ` va` | Select all | `ggVG` |
| NORMAL | ` s` | Replace word under cursor | `:%s/\<lt><C-R><C-W>\>/<C-R><C-W>/gI<Left><Left><Left>` |
| NORMAL | ` sn` | Save without formatting | `<Cmd>noautocmd w<CR>` |
| NORMAL | ` Y` | Yank line to system clipboard | `"+Y` |
| NORMAL | ` y` | Yank to system clipboard | `"+y` |
| NORMAL | ` P` | Paste before from yank register | `"0P` |
| NORMAL | ` p` | Paste from yank register | `"0p` |
| NORMAL | ` C` | Change line without yanking | `"_C` |
| NORMAL | ` c` | Change without yanking | `"_c` |
| NORMAL | ` D` | Delete line without yanking | `"_D` |
| NORMAL | ` d` | Delete without yanking | `"_d` |
| NORMAL | `&` | :help &-default | `:&&<CR>` |
| NORMAL | `+` | Increment number | `<C-A>` |
| NORMAL | `-` | Decrement number | `<C-X>` |
| NORMAL | `=ap` | Reindent paragraph | `ma=ap'a` |
| NORMAL | `Y` | :help Y-default | `y$` |
| NORMAL | `Zk` | Flash treesitter | `` |
| NORMAL | `[u` | Undo backward | `<Cmd>lua MiniBracketed.undo('backward')<CR>` |
| NORMAL | `[U` | Undo first | `<Cmd>lua MiniBracketed.undo('first')<CR>` |
| NORMAL | `[n` | Treesitter backward | `<Cmd>lua MiniBracketed.treesitter('backward')<CR>` |
| NORMAL | `[N` | Treesitter first | `<Cmd>lua MiniBracketed.treesitter('first')<CR>` |
| NORMAL | `[o` | Oldfile backward | `<Cmd>lua MiniBracketed.oldfile('backward')<CR>` |
| NORMAL | `[O` | Oldfile first | `<Cmd>lua MiniBracketed.oldfile('first')<CR>` |
| NORMAL | `[j` | Jump backward | `<Cmd>lua MiniBracketed.jump('backward')<CR>` |
| NORMAL | `[J` | Jump first | `<Cmd>lua MiniBracketed.jump('first')<CR>` |
| NORMAL | `[i` | Indent backward | `<Cmd>lua MiniBracketed.indent('backward')<CR>` |
| NORMAL | `[I` | Indent first | `<Cmd>lua MiniBracketed.indent('first')<CR>` |
| NORMAL | `[x` | Conflict backward | `<Cmd>lua MiniBracketed.conflict('backward')<CR>` |
| NORMAL | `[X` | Conflict first | `<Cmd>lua MiniBracketed.conflict('first')<CR>` |
| NORMAL | `[c` | Comment backward | `<Cmd>lua MiniBracketed.comment('backward')<CR>` |
| NORMAL | `[C` | Comment first | `<Cmd>lua MiniBracketed.comment('first')<CR>` |
| NORMAL | `[ ` | Add empty line above cursor | `` |
| NORMAL | `[B` | Buffer first | `<Cmd>lua MiniBracketed.buffer('first')<CR>` |
| NORMAL | `[b` | Buffer backward | `<Cmd>lua MiniBracketed.buffer('backward')<CR>` |
| NORMAL | `[<C-T>` | :ptprevious | `` |
| NORMAL | `[T` | :trewind | `` |
| NORMAL | `[t` | :tprevious | `` |
| NORMAL | `[A` | :rewind | `` |
| NORMAL | `[a` | :previous | `` |
| NORMAL | `[<C-L>` | :lpfile | `` |
| NORMAL | `[L` | Location first | `<Cmd>lua MiniBracketed.location('first')<CR>` |
| NORMAL | `[l` | Location backward | `<Cmd>lua MiniBracketed.location('backward')<CR>` |
| NORMAL | `[<C-Q>` | :cpfile | `` |
| NORMAL | `[Q` | :crewind | `` |
| NORMAL | `[q` | :cprevious | `` |
| NORMAL | `[D` | Diagnostic first | `<Cmd>lua MiniBracketed.diagnostic('first')<CR>` |
| NORMAL | `[d` | Diagnostic backward | `<Cmd>lua MiniBracketed.diagnostic('backward')<CR>` |
| NORMAL | `]u` | Undo forward | `<Cmd>lua MiniBracketed.undo('forward')<CR>` |
| NORMAL | `]U` | Undo last | `<Cmd>lua MiniBracketed.undo('last')<CR>` |
| NORMAL | `]n` | Treesitter forward | `<Cmd>lua MiniBracketed.treesitter('forward')<CR>` |
| NORMAL | `]N` | Treesitter last | `<Cmd>lua MiniBracketed.treesitter('last')<CR>` |
| NORMAL | `]o` | Oldfile forward | `<Cmd>lua MiniBracketed.oldfile('forward')<CR>` |
| NORMAL | `]O` | Oldfile last | `<Cmd>lua MiniBracketed.oldfile('last')<CR>` |
| NORMAL | `]j` | Jump forward | `<Cmd>lua MiniBracketed.jump('forward')<CR>` |
| NORMAL | `]J` | Jump last | `<Cmd>lua MiniBracketed.jump('last')<CR>` |
| NORMAL | `]i` | Indent forward | `<Cmd>lua MiniBracketed.indent('forward')<CR>` |
| NORMAL | `]I` | Indent last | `<Cmd>lua MiniBracketed.indent('last')<CR>` |
| NORMAL | `]x` | Conflict forward | `<Cmd>lua MiniBracketed.conflict('forward')<CR>` |
| NORMAL | `]X` | Conflict last | `<Cmd>lua MiniBracketed.conflict('last')<CR>` |
| NORMAL | `]c` | Comment forward | `<Cmd>lua MiniBracketed.comment('forward')<CR>` |
| NORMAL | `]C` | Comment last | `<Cmd>lua MiniBracketed.comment('last')<CR>` |
| NORMAL | `] ` | Add empty line below cursor | `` |
| NORMAL | `]B` | Buffer last | `<Cmd>lua MiniBracketed.buffer('last')<CR>` |
| NORMAL | `]b` | Buffer forward | `<Cmd>lua MiniBracketed.buffer('forward')<CR>` |
| NORMAL | `]<C-T>` | :ptnext | `` |
| NORMAL | `]T` | :tlast | `` |
| NORMAL | `]t` | :tnext | `` |
| NORMAL | `]A` | :last | `` |
| NORMAL | `]a` | :next | `` |
| NORMAL | `]<C-L>` | :lnfile | `` |
| NORMAL | `]L` | Location last | `<Cmd>lua MiniBracketed.location('last')<CR>` |
| NORMAL | `]l` | Location forward | `<Cmd>lua MiniBracketed.location('forward')<CR>` |
| NORMAL | `]<C-Q>` | :cnfile | `` |
| NORMAL | `]Q` | :clast | `` |
| NORMAL | `]q` | :cnext | `` |
| NORMAL | `]D` | Diagnostic last | `<Cmd>lua MiniBracketed.diagnostic('last')<CR>` |
| NORMAL | `]d` | Diagnostic forward | `<Cmd>lua MiniBracketed.diagnostic('forward')<CR>` |
| NORMAL | `g]` | Move to right "around" | `` |
| NORMAL | `g[` | Move to left "around" | `` |
| NORMAL | `g<C-A>` | Increment sequence | `` |
| NORMAL | `g<C-X>` | Decrement sequence | `` |
| NORMAL | `gO` | vim.lsp.buf.document_symbol() | `` |
| NORMAL | `grt` | vim.lsp.buf.type_definition() | `` |
| NORMAL | `gri` | vim.lsp.buf.implementation() | `` |
| NORMAL | `grr` | vim.lsp.buf.references() | `` |
| NORMAL | `grx` | vim.lsp.codelens.run() | `` |
| NORMAL | `gra` | vim.lsp.buf.code_action() | `` |
| NORMAL | `grn` | vim.lsp.buf.rename() | `` |
| NORMAL | `gcc` | Toggle comment line | `` |
| NORMAL | `gc` | Toggle comment | `` |
| NORMAL | `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) | `` |
| NORMAL | `shn` | Highlight next surrounding | `` |
| NORMAL | `shl` | Highlight previous surrounding | `` |
| NORMAL | `sh` | Highlight surrounding | `` |
| NORMAL | `sFn` | Find next left surrounding | `` |
| NORMAL | `sFl` | Find previous left surrounding | `` |
| NORMAL | `sF` | Find left surrounding | `` |
| NORMAL | `sfn` | Find next right surrounding | `` |
| NORMAL | `sfl` | Find previous right surrounding | `` |
| NORMAL | `sf` | Find right surrounding | `` |
| NORMAL | `srn` | Replace next surrounding | `` |
| NORMAL | `srl` | Replace previous surrounding | `` |
| NORMAL | `sr` | Replace surrounding | `` |
| NORMAL | `sdn` | Delete next surrounding | `` |
| NORMAL | `sdl` | Delete previous surrounding | `` |
| NORMAL | `sd` | Delete surrounding | `` |
| NORMAL | `sa` | Add surrounding | `` |
| NORMAL | `sv` | Vertical split | `<Cmd>vsplit<CR>` |
| NORMAL | `ss` | Horizontal split | `<Cmd>split<CR>` |
| NORMAL | `zM` | Close all folds | `` |
| NORMAL | `zR` | Open all folds | `` |
| NORMAL | `zk` | Flash jump | `` |
| NORMAL | `<S-Tab>` | Previous buffer | `<Cmd>BufferLineCyclePrev<CR>` |
| NORMAL | `<M-k>` | Move line up | `<Cmd>lua MiniMove.move_line('up')<CR>` |
| NORMAL | `<M-j>` | Move line down | `<Cmd>lua MiniMove.move_line('down')<CR>` |
| NORMAL | `<M-l>` | Move line right | `<Cmd>lua MiniMove.move_line('right')<CR>` |
| NORMAL | `<M-h>` | Move line left | `<Cmd>lua MiniMove.move_line('left')<CR>` |
| NORMAL | `<Plug>(TriforceProfile)` | Triforce: Show profile | `` |
| NORMAL | `<C-X>` | Decrement | `` |
| NORMAL | `<C-A>` | Increment | `` |
| NORMAL | `<M-p>` | Location list previous | `<Cmd>lprev<CR>zz` |
| NORMAL | `<M-n>` | Location list next | `<Cmd>lnext<CR>zz` |
| NORMAL | `<C-P>` | Quickfix previous | `<Cmd>cprev<CR>zz` |
| NORMAL | `<C-N>` | Quickfix next | `<Cmd>cnext<CR>zz` |
| NORMAL | `<Right>` | Resize window right | `<Cmd>vertical resize +2<CR>` |
| NORMAL | `<Left>` | Resize window left | `<Cmd>vertical resize -2<CR>` |
| NORMAL | `<Down>` | Resize window down | `<Cmd>resize +2<CR>` |
| NORMAL | `<Up>` | Resize window up | `<Cmd>resize -2<CR>` |
| NORMAL | `<M-O>` | Add blank line above | `O<Esc>^Da` |
| NORMAL | `<M-o>` | Add blank line below | `o<Esc>^Da` |
| NORMAL | `<C-S>` | Save file | `<Cmd>w<CR>` |
| NORMAL | `<C-W><C-D>` | Show diagnostics under the cursor | `<C-W>d` |
| NORMAL | `<C-W>d` | Show diagnostics under the cursor | `` |
