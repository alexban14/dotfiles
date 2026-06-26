# Neovim Configuration

A Lua-based Neovim setup (the `banalexandru` config) geared toward web and PHP/Laravel
development, with LSP, Treesitter, fuzzy finding, Git integration, testing, and AI
completion. Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

> **Installation:** see [install.md](install.md).
> **Leader key:** `<Space>` (local leader is also `<Space>`).

## Contents

- [Requirements](#requirements)
- [Layout](#layout)
- [Plugin management (lazy.nvim)](#plugin-management-lazynvim)
- [Editor settings](#editor-settings)
- [Keymaps](#keymaps)
  - [General & editing](#general--editing)
  - [File & project navigation](#file--project-navigation)
  - [Harpoon](#harpoon)
  - [Buffers](#buffers)
  - [Windows & tmux](#windows--tmux)
  - [LSP](#lsp)
  - [Diagnostics](#diagnostics)
  - [Completion & snippets](#completion--snippets)
  - [Git](#git)
  - [Testing](#testing)
  - [Comments, surround & friends](#comments-surround--friends)
  - [Text objects](#text-objects)
  - [PHP / Laravel](#php--laravel)
- [Commands](#commands)
- [Plugins](#plugins)
- [LSP servers & tooling](#lsp-servers--tooling)
- [Known keymap overlaps](#known-keymap-overlaps)
- [UI](#ui)
- [Troubleshooting](#troubleshooting)

## Requirements

- **Neovim ≥ 0.11** (uses the `vim.lsp.config`/`vim.lsp.enable` API; 0.12+ recommended)
- Git, a C compiler + `tree-sitter` CLI (Treesitter parsers)
- Node.js + npm (several LSP servers), `ripgrep` (Telescope grep)
- PHP + Composer (phpactor), a Nerd Font, a true-color terminal

## Layout

```
init.lua                         -> require('banalexandru')
lua/banalexandru/
├── init.lua                     loads remap, set, lazy
├── remap.lua                    core (non-plugin) keymaps
├── set.lua                      editor options
├── lazy.lua                     lazy.nvim bootstrap + all plugin specs
└── plugins/                     per-plugin config modules
    ├── lspconfig.lua            LSP servers, none-ls, diagnostics, LSP keymaps
    ├── cmp.lua                  completion
    ├── treesitter.lua           parsers + text objects
    ├── nvim-tree.lua            file tree
    ├── lualine.lua              status line
    ├── bufferline.lua           buffer tabs + buffer keymaps
    ├── blankline.lua            indent guides + rainbow delimiters
    ├── projectionist.lua        Laravel project navigation
    └── vim-test.lua             test runner keymaps
lazy-lock.json                   pinned plugin versions
phpactor/                        phpactor templates/config
```

The runtime config lives in this directory; `~/.config/nvim` is a symlink to it.

## Plugin management (lazy.nvim)

lazy.nvim bootstraps itself on first launch and installs everything automatically.

| Command | Action |
|---------|--------|
| `:Lazy` | Open the plugin manager UI |
| `:Lazy sync` | Install missing, clean removed, update to spec |
| `:Lazy update` | Update plugins (refreshes `lazy-lock.json`) |
| `:Lazy restore` | Install the exact versions pinned in `lazy-lock.json` |
| `:Lazy profile` | Startup profiling |
| `:Mason` | Manage LSP servers / formatters / linters |
| `:TSUpdate` | Update Treesitter parsers |

## Editor settings

Defined in `set.lua`:

| Setting | Value | Notes |
|---------|-------|-------|
| Line numbers | on | absolute + relative (hybrid) |
| Tabs | 4 | `tabstop`/`softtabstop`/`shiftwidth` = 4, `expandtab` (spaces) |
| Indent | `smartindent` | (auto-detection via vim-sleuth) |
| Wrap | off | horizontal scroll |
| Swap / backup | off | |
| Undo | persistent (`undofile`) | survives restarts |
| Search | `incsearch`, `hlsearch` off, `ignorecase` + `smartcase` | |
| Colors | `termguicolors` | true color |
| Scrolloff | 8 | keep 8 lines of context |
| Sign column | always on | no layout shift |
| Updatetime | 50 ms | snappy diagnostics/CursorHold |
| Color column | 80 | guide at column 80 |
| Mouse | all modes (`a`) | |
| Cursor | block in all modes (`guicursor=""`) | |
| Spell | on | default dictionary |
| List chars | `tab ▸`, `trail ·` | whitespace visible; `~` end-of-buffer hidden |
| Clipboard | `unnamedplus` | yanks go to the system clipboard |
| Confirm | on | prompt instead of erroring on unsaved changes |

## Keymaps

Leader = `<Space>`. Conventions below: `<C-x>` = Ctrl+x, `<Leader>` = Space.

### General & editing

| Key | Mode | Action |
|-----|------|--------|
| `<Leader>pv` | n | Open netrw file explorer (`:Ex`) |
| `<` / `>` | v | Indent left/right and **keep** the selection |
| `y` | v | Yank but preserve cursor position |

### File & project navigation

**Telescope**

| Key | Action |
|-----|--------|
| `<Leader>pf` | Find files in project |
| `<C-p>` | Find git-tracked files |
| `<Leader>ps` | Grep (prompts for a search string) |
| `gi` | LSP implementations (Telescope) |
| `gr` | LSP references (Telescope) |

Inside a Telescope picker: `<C-n>`/`<C-p>` move, `<CR>` open, `<C-x>`/`<C-v>`/`<C-t>`
open in split/vsplit/tab, `<C-u>`/`<C-d>` scroll preview, `<Esc>` close.

**nvim-tree**

| Key | Action |
|-----|--------|
| `<Leader>ft` | Toggle the tree and focus the current file |

Inside the tree (defaults): `<CR>`/`o` open, `a` create, `d` delete, `r` rename,
`x` cut, `c` copy, `p` paste, `R` refresh, `H` toggle hidden, `?` help.

Project root is set automatically (vim-rooter); `vim-lastplace` restores the cursor to
your last position when reopening a file.

### Harpoon

Pin a handful of files and jump between them instantly (harpoon v1 API).

| Key | Action |
|-----|--------|
| `<Leader>a` | Add current file to the list |
| `<Leader><C-e>` | Toggle the quick menu |
| `<C-h>` | Jump to file 1 |
| `<C-t>` | Jump to file 2 |
| `<C-n>` | Jump to file 3 |
| `<C-s>` | Jump to file 4 |

### Buffers

Buffers are shown as tabs by bufferline.

| Key | Action |
|-----|--------|
| `<Leader>1` / `<Leader>2` / `<Leader>3` | Go to buffer 1 / 2 / 3 |
| `<Leader>bn` / `<Leader>bp` | Next / previous buffer |
| `<Leader>bd` | Delete current buffer |
| `<Leader>bo` | Close buffers to the left and right |
| `<Leader>q` | Close buffer, keep the window open (bufdelete) |

### Windows & tmux

vim-tmux-navigator moves seamlessly between Neovim splits and tmux panes:

| Key | Action |
|-----|--------|
| `<C-j>` | Move to the split/pane below |
| `<C-k>` | Move to the split/pane above |
| `<C-l>` | Move to the split/pane right |

> `<C-h>` (normally "move left") is rebound to Harpoon here — see
> [Known keymap overlaps](#known-keymap-overlaps).

### LSP

Active once a language server attaches to the buffer.

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gi` | Go to implementation (Telescope) |
| `gr` | Find references (Telescope) |
| `K` | Hover documentation |
| `<Leader>rn` | Rename symbol |
| `:Format` | Format the buffer via the LSP |

### Diagnostics

| Key | Action |
|-----|--------|
| `<Leader>d` | Show diagnostic float under the cursor |
| `[d` | Previous diagnostic (and open float) |
| `]d` | Next diagnostic (and open float) |

Virtual text is **off**; diagnostics show as gutter signs (` `/` `/` `/` `) plus the
float. The float includes the source.

### Completion & snippets

nvim-cmp with LSP, snippet, buffer, path, and signature-help sources (+ Codeium AI).

| Key | Action |
|-----|--------|
| `<Tab>` | Next item · expand/jump snippet · trigger completion |
| `<S-Tab>` | Previous item · jump snippet backward |
| `<CR>` | Confirm the selected item |

Ghost text preview is enabled. Sources, in order: LSP, signature help, LuaSnip, buffer,
path. Snippets load from SnipMate-format files via LuaSnip.

### Git

**gitsigns** (hunks, signs, blame)

| Key | Action |
|-----|--------|
| `]h` / `[h` | Next / previous hunk |
| `gs` | Stage hunk |
| `gS` | Undo stage hunk |
| `gp` | Preview hunk |
| `gb` | Blame current line |

**fugitive / rhubarb** (commands): `:Git` (status), `:Git blame`, `:Gdiffsplit`,
`:Gwrite`, `:Gread`, `:GBrowse` (open on the host, e.g. GitHub).

### Testing

vim-test (auto-detects PHPUnit, Jest, etc.):

| Key | Action |
|-----|--------|
| `<Leader>tn` | Test nearest |
| `<Leader>tf` | Test file |
| `<Leader>ts` | Test suite |
| `<Leader>tl` | Test last |
| `<Leader>tv` | Visit the test file |

### Comments, surround & friends

These come from the tpope plugins (default mappings):

| Key | Plugin | Action |
|-----|--------|--------|
| `gcc` | vim-commentary | Toggle comment on the line |
| `gc{motion}` / `gc` (visual) | vim-commentary | Toggle comment over a motion/selection |
| `ys{motion}{char}` | vim-surround | Add surround (e.g. `ysiw"`) |
| `cs{old}{new}` | vim-surround | Change surround (e.g. `cs"'`) |
| `ds{char}` | vim-surround | Delete surround |
| `S{char}` (visual) | vim-surround | Surround the selection |
| `[b` / `]b` | vim-unimpaired | Previous / next buffer |
| `[q` / `]q` | vim-unimpaired | Previous / next quickfix item |
| `[<Space>` / `]<Space>` | vim-unimpaired | Add blank line above / below |
| `*` / `#` (visual) | vim-visual-star-search | Search for the selected text |
| `.` | vim-repeat | Repeat the last plugin map |

Also active without keymaps: **nvim-autopairs** (auto-close brackets/quotes),
**neoscroll** (smooth `<C-u>`/`<C-d>`/`<C-f>`/`<C-b>`/`zz`), **vim-pasta**
(indentation-aware paste), **vim-heritage** (auto-create parent dirs on save).

### Text objects

Treesitter-based (`nvim-treesitter-textobjects`) plus xmlattr:

| Object | Selects |
|--------|---------|
| `if` / `af` | Inner / outer function |
| `ia` / `aa` | Inner / outer parameter (argument) |
| `ix` / `ax` | Inner / outer XML/HTML attribute (vim-textobj-xmlattr) |

Use with operators/visual, e.g. `vif`, `daf`, `cia`.

### Split/join

vim-splitjoin (config: trailing comma added, PHP method chains and HTML attributes
expand one per line):

| Key | Action |
|-----|--------|
| `gJ` | Join a multi-line construct onto one line |
| `gS` | Split a one-line construct across lines — **shadowed by gitsigns**, use `:SplitjoinSplit` |

### PHP / Laravel

**phpactor** (loads for `php` files):

| Key | Action |
|-----|--------|
| `<Leader>pm` | Phpactor context menu (refactors, etc.) |
| `<Leader>pn` | New class |

Plus `:Phpactor*` commands (e.g. `:PhpactorImportClass`, `:PhpactorMoveClass`).

**projectionist** — Laravel heuristics. Jump between source and tests, and run artisan:

| Command | Action |
|---------|--------|
| `:A` | Switch to the alternate file (source ↔ test) |
| `:AS` / `:AV` | Alternate in a horizontal / vertical split |
| `:Estart` | `php artisan serve` (via dispatch) |
| `:Econsole` | `php artisan tinker` |

Recognized types: `model`, `controller`, `route`, `migration`, `source`, `test`.
`app/*.php` alternates with `tests/Unit/*Test.php` and `tests/Feature/*Test.php`.

## Commands

| Command | Source | Action |
|---------|--------|--------|
| `:Format` | this config | Format the buffer via LSP |
| `:Lazy`, `:Lazy sync/update/restore` | lazy.nvim | Plugin management |
| `:Mason` | mason.nvim | Manage external LSP/DAP/linter/formatter tools |
| `:TSUpdate`, `:TSInstall {lang}` | nvim-treesitter | Parser management |
| `:Git`, `:Gdiffsplit`, `:GBrowse` | fugitive/rhubarb | Git |
| `:Gitsigns {action}` | gitsigns | Hunk/stage/blame actions |
| `:Test*` | vim-test | `:TestNearest`, `:TestFile`, … |
| `:A`, `:AS`, `:AV` | projectionist | Alternate-file navigation |
| `:Phpactor*` | phpactor | PHP refactoring |
| `:Rename`, `:Move`, `:Delete`, `:Chmod`, `:Mkdir`, `:SudoWrite` | vim-eunuch | File ops on the current buffer |
| `:Codeium Auth` | codeium.nvim | Authenticate Codeium |

## Plugins

Managed in `lua/banalexandru/lazy.lua`.

**UI / appearance**
- `rose-pine/neovim` — colorscheme
- `nvim-lualine/lualine.nvim` — status line
- `akinsho/bufferline.nvim` — buffers as tabs
- `kyazdani42/nvim-tree.lua` (+ `nvim-web-devicons`) — file tree
- `lukas-reineke/indent-blankline.nvim` (ibl) + `HiPhish/rainbow-delimiters.nvim` — indent guides & rainbow brackets

**Navigation**
- `nvim-telescope/telescope.nvim` (+ `plenary.nvim`) — fuzzy finder
- `ThePrimeagen/harpoon` — pinned-file switching
- `christoomey/vim-tmux-navigator` — split/pane navigation
- `airblade/vim-rooter` — cd to project root
- `farmergreg/vim-lastplace` — restore cursor position
- `nelstrom/vim-visual-star-search` — `*`/`#` on selections

**Editing**
- `tpope/vim-commentary`, `vim-surround`, `vim-eunuch`, `vim-unimpaired`, `vim-sleuth`, `vim-repeat`
- `windwp/nvim-autopairs`, `karb94/neoscroll.nvim`, `AndrewRadev/splitjoin.vim`, `sickill/vim-pasta`, `jessarcher/vim-heritage`
- `whatyouhide/vim-textobj-xmlattr` (+ `kana/vim-textobj-user`)
- `sheerun/vim-polyglot` — syntax (bundled autoindent disabled in favor of vim-sleuth)

**Git**
- `tpope/vim-fugitive` (+ `tpope/vim-rhubarb`), `lewis6991/gitsigns.nvim`

**LSP / completion**
- `neovim/nvim-lspconfig`, `williamboman/mason.nvim`, `mason-lspconfig.nvim`
- `b0o/schemastore.nvim` — JSON schemas
- `nvimtools/none-ls.nvim` (+ `none-ls-extras.nvim`) — formatters/linters as LSP
- `hrsh7th/nvim-cmp` (+ `cmp-nvim-lsp`, `cmp-nvim-lsp-signature-help`, `cmp-buffer`, `cmp-path`)
- `L3MON4D3/LuaSnip` (+ `saadparwaiz1/cmp_luasnip`), `onsails/lspkind-nvim`

**Treesitter**
- `nvim-treesitter/nvim-treesitter` (+ `nvim-treesitter-textobjects`)

**PHP / project / test**
- `phpactor/phpactor`, `tpope/vim-projectionist` (+ `tpope/vim-dispatch`), `vim-test/vim-test`

**AI**
- `Exafunction/codeium.nvim` — AI completion (cmp source)

## LSP servers & tooling

Enabled servers (installed via `:Mason`):

| Server | Language | Notes |
|--------|----------|-------|
| `intelephense` | PHP | |
| `ts_ls` | JS/TS | runs the `@vue/typescript-plugin` for `.vue` |
| `vue_ls` | Vue | Volar 2.x hybrid mode |
| `tailwindcss` | Tailwind | |
| `jsonls` | JSON | schemas from schemastore |
| `lua_ls` | Lua | aware of the Neovim runtime (`vim` global) |

Ensured parsers (Treesitter): `lua`, `vim`, `vimdoc`, `go`, `rust`, `c`, `cpp`,
`javascript`, `typescript`, `html`, `css`, `json`, `yaml`, `markdown`.

**none-ls** sources: `prettierd` (formatting), `trail_space` (trailing-whitespace
diagnostics), and `eslint_d` for diagnostics + formatting when an ESLint config is
present (flat `eslint.config.*` or legacy `.eslintrc*`).

## Known keymap overlaps

A few mappings intentionally override plugin/Vim defaults. If something feels missing,
this is usually why:

- **`<C-h>`** → Harpoon "jump to file 1", so it does **not** navigate to the left
  split/pane (use `<C-j>`/`<C-k>`/`<C-l>` for the others). Remap Harpoon in `lazy.lua`
  if you want tmux-style left navigation back.
- **`gS`** → gitsigns "undo stage hunk", which shadows splitjoin's split. Use
  `:SplitjoinSplit` (or remap) to split.
- **`<C-s>` / `<C-n>` / `<C-t>`** → Harpoon file jumps, overriding their usual roles
  (terminal stop / down / pop-tag). `<C-s>` may also be swallowed by terminal flow
  control unless `stty -ixon` is set.

## UI

- **Theme:** rose-pine.
- **Status line:** mode · branch · diff · attached-LSP count · diagnostics · filename ·
  filetype/encoding/format · indent style · location/progress.
- **Buffer line:** slanted separators, modified indicator, file-tree offset header.
- **Indent guides:** indent-blankline with rainbow-delimiter scope colors.

## Troubleshooting

- **Plugins:** `:Lazy` (status), `:Lazy sync` (repair).
- **LSP:** `:checkhealth vim.lsp`, `:Mason` (install servers), `:LspInfo`.
- **Treesitter:** `:checkhealth nvim-treesitter`, `:TSUpdate`.
- **General:** `:checkhealth`.

See [install.md](install.md) for first-time setup.
