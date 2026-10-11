# ⌨️ Neovim Keybindings Cheat Sheet

Leader key: `<space>`

---

## 💻 Integrated Terminal (Toggleterm)

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `<C-\>` | Normal, Terminal | `ToggleTerm` | Toggle horizontal terminal drawer |
| `<Esc><Esc>` | Terminal | `<C-\><C-n>` | **Double Esc** to exit terminal mode to Normal mode |
| `jk` | Terminal | `<C-\><C-n>` | Type **`jk`** to exit terminal mode to Normal mode |
| `<C-\><C-n>` | Terminal | Native Neovim | Native Neovim shortcut to exit terminal mode |
| `<C-h>` | Terminal | `wincmd h` | Navigate to window on the left |
| `<C-j>` | Terminal | `wincmd j` | Navigate to window below |
| `<C-k>` | Terminal | `wincmd k` | Navigate to window above |
| `<C-l>` | Terminal | `wincmd l` | Navigate to window on the right |

---

## 📄 File & Tab Management

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `<leader>fn` | Normal | `enew` | Create a new empty buffer / file |
| `<leader>tn` | Normal | `tabnew` | Open a new tab |
| `<leader>tc` | Normal | `tabclose` | Close current tab |
| `[t` | Normal | `tabprevious` | Jump to previous tab |
| `]t` | Normal | `tabnext` | Jump to next tab |

---

## 🧭 Navigation & Window Management

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `<C-h>` | Normal | `wincmd h` | Move cursor to left window split |
| `<C-j>` | Normal | `wincmd j` | Move cursor to lower window split |
| `<C-k>` | Normal | `wincmd k` | Move cursor to upper window split |
| `<C-l>` | Normal | `wincmd l` | Move cursor to right window split |
| `<S-h>` | Normal | `bprevious` | Switch to previous buffer |
| `<S-l>` | Normal | `bnext` | Switch to next buffer |
| `<Esc>` | Normal | `nohlsearch` | Clear search highlights |
| `-` | Normal | `Oil` | Open parent directory in Oil file explorer |

---

## 🔍 File & Project Navigation (Emacs-like)

| Keybinding | Mode | Command / Action | Description |
| :--- | :--- | :--- | :--- |
| `<leader>fp` | Normal | `Telescope projects` | Fuzzy search and jump into any project (`~/.config`, `~/.suckless`, `~/Projects/*`) |
| `<leader>fr` | Normal | `Telescope oldfiles` | Fuzzy search recently opened files |
| `<leader>ff` | Normal | `Telescope find_files` | Find files in current workspace |
| `<leader>fg` | Normal | `Telescope live_grep` | Search text across workspace (live grep) |
| `<leader>fb` | Normal | `Telescope buffers` | Search active open buffers |
| `<leader>fh` | Normal | `Telescope help_tags` | Search Neovim help tags |
| `<leader>sr` | Normal | `Grug-far` | Open workspace-wide Search & Replace UI |

---

## 📝 Orgmode (Notes & TODO Tracking)

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `<leader>oa` | Normal | `Org Agenda` | Open Orgmode Agenda View |
| `<leader>oc` | Normal | `Org Capture` | Open Orgmode Capture prompt |
| `<tab>` | Normal (org) | `Org Cycle` | Fold / Expand headline subtree |
| `t` | Normal (org) | `Org Todo` | Cycle TODO state (TODO -> DONE) |

---

## ⚡ Flash Motion (Fast Navigation)

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `s` | Normal, Visual, Operator | `Flash` | Jump anywhere on screen by typing labels |
| `S` | Normal, Visual, Operator | `Flash Treesitter` | Select Treesitter nodes interactively |
| `r` | Operator | `Remote Flash` | Perform operator actions (delete, change) remotely |
| `R` | Visual, Operator | `Treesitter Search` | Search with Treesitter patterns |
| `<C-s>` | Command | `Toggle Flash` | Toggle Flash search mode while typing search |

---

## 🧠 LSP & Code Navigation

| Keybinding | Mode | Command / Action | Description |
| :--- | :--- | :--- | :--- |
| `gd` | Normal | `vim.lsp.buf.definition` | Go to definition under cursor |
| `K` | Normal | `vim.lsp.buf.hover` | Show hover documentation popup |
| `<leader>ca` | Normal | `vim.lsp.buf.code_action` | Code actions & quick fixes |
| `<leader>rn` | Normal | `vim.lsp.buf.rename` | Rename symbol workspace-wide |
| `<leader>fm` | Normal/Visual | `conform.format` | Format current buffer |
| `<leader>rs` | Normal | `:LspRestart` | Restart all active LSP servers |

---

## 📜 LaTeX & VimTeX

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `<leader>ll` | Normal (tex) | `VimtexCompile` | Toggle LaTeX compilation (continuous mode via latexmk) |
| `<leader>lv` | Normal (tex) | `VimtexView` | View output PDF in viewer (Zathura) / Forward Search |
| `<leader>lt` | Normal (tex) | `VimtexTocToggle` | Toggle LaTeX Table of Contents side panel |
| `<leader>lc` | Normal (tex) | `VimtexClean` | Clean auxiliary LaTeX build files (.aux, .log, etc.) |
| `<leader>le` | Normal (tex) | `VimtexErrors` | Open quickfix list of LaTeX compile errors |
| `<leader>lq` | Normal (tex) | `VimtexLog` | Show full compiler log |
| `tsf` / `tse` | Normal (tex) | `Vimtex Toggle` | Toggle environment surrounding formula/block |

---

## 🚨 Diagnostics & Errors

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `<leader>e` | Normal | `vim.diagnostic.open_float` | Show line diagnostic popup |
| `<leader>d` | Normal | `vim.diagnostic.open_float` | Show line diagnostic popup (LSP buffer) |
| `[d` | Normal | `vim.diagnostic.jump({ count = -1 })` | Jump to previous diagnostic error/warning |
| `]d` | Normal | `vim.diagnostic.jump({ count = 1 })` | Jump to next diagnostic error/warning |
| `<leader>xx` | Normal | `Trouble diagnostics toggle` | Toggle workspace diagnostics panel |
| `<leader>xX` | Normal | `Trouble diagnostics toggle filter.buf=0` | Toggle current buffer diagnostics panel |

---

## 🌿 Git Operations (Gitsigns)

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `]c` | Normal | `Gitsigns next_hunk` | Jump to next git change/hunk |
| `[c` | Normal | `Gitsigns prev_hunk` | Jump to previous git change/hunk |
| `<leader>hs` | Normal | `Gitsigns stage_hunk` | Stage current git hunk |
| `<leader>hr` | Normal | `Gitsigns reset_hunk` | Reset current git hunk |
| `<leader>hp` | Normal | `Gitsigns preview_hunk` | Preview diff for current git hunk |
| `<leader>bl` | Normal | `Gitsigns blame_line` | View full git blame for current line |

---

## 🔄 Surround Editing (nvim-surround)

| Shortcut | Description | Example |
| :--- | :--- | :--- |
| `ys{motion}{char}` | Add surrounding around motion | `ysiw"` wraps current word in `"` |
| `yss{char}` | Add surrounding to current line | `yss)` wraps line in `()` |
| `ds{char}` | Delete surrounding character | `ds"` removes surrounding `"` |
| `cs{target}{replacement}` | Change surrounding character | `cs"'` changes `"` to `'` |

---

## 💾 Sessions & Keymap Helper

| Keybinding | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `<leader>qs` | Normal | `Persistence load` | Restore saved session for current directory |
| `<leader>ql` | Normal | `Persistence load (last)` | Restore last opened session |
| `<leader>?` | Normal | `WhichKey` | Show full Which-key popup |

---

## 📂 Oil File Explorer (Active inside Oil buffers)

| Keybinding | Action |
| :--- | :--- |
| `<CR>` | Open selected file/folder |
| `<C-s>` | Open in vertical split |
| `<C-h>` | Open in horizontal split |
| `<C-p>` | Preview file |
| `<C-c>` | Close Oil explorer |
| `<C-l>` | Refresh explorer |
| `-` | Go to parent directory |
| `_` | Open current working directory |
| `gs` | Change sorting method |
| `gx` | Open file with external default app |
| `g.` | Toggle hidden files/folders |
