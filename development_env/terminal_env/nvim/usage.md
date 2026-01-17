# Neovim Usage Guide

## Leader Key

The leader key is set to `<Space>`.

## Core Features

### Editor Settings

| Setting | Value | Description |
|---------|-------|-------------|
| Line numbers | Enabled | Absolute and relative |
| Tab size | 4 | Soft and hard tabs |
| Shift width | 4 | Auto-indent amount |
| Expand tabs | Yes | Spaces instead of tabs |
| Smart indent | Yes | Auto-indent based on context |
| Wrap | No | Horizontal scrolling |
| Swap file | No | No .swp files |
| Undo file | Yes | Persistent undo |
| Mouse | Enabled | All modes |
| Spell check | Enabled | Default dictionary |
| Color column | 80 | Line at column 80 |
| Clipboard | unnamedplus | System clipboard |
| Confirm | Yes | Ask instead of error |

### Visual Mode

| Shortcut | Action |
|----------|--------|
| `<` | Indent left (keep selection) |
| `>` | Indent right (keep selection) |
| `y` | Yank with cursor position preservation |

## File Navigation

### Telescope

| Shortcut | Action |
|----------|--------|
| `<leader>pf` | Find files in project |
| `<C-p>` | Find git-tracked files |
| `<leader>ps` | Grep search (prompts for pattern) |

### Nvim-Tree

| Shortcut | Action |
|----------|--------|
| `<leader>ft` | Toggle file tree |

### Harpoon (Quick File Switching)

| Shortcut | Action |
|----------|--------|
| `<leader>a` | Add file to harpoon |
| `<leader><C-e>` | Toggle harpoon menu |
| `<C-h>` | Navigate to file 1 |
| `<C-t>` | Navigate to file 2 |
| `<C-n>` | Navigate to file 3 |
| `<C-s>` | Navigate to file 4 |

### Buffer Navigation

| Shortcut | Action |
|----------|--------|
| `<leader>1` | Go to buffer 1 |
| `<leader>2` | Go to buffer 2 |
| `<leader>3` | Go to buffer 3 |
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bd` | Delete current buffer |
| `<leader>bo` | Close all other buffers |
| `<leader>q` | Close buffer (famiu/bufdelete) |
| `<leader>pv` | Netrw file explorer |

## LSP Features

### Navigation

| Shortcut | Action |
|----------|--------|
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `gr` | Show references |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `K` | Hover documentation |

### Actions

| Shortcut | Action |
|----------|--------|
| `<leader>d` | Show diagnostic in float |
| `<leader>rn` | Rename symbol |
| `<leader>pm` | Phpactor context menu (PHP) |
| `<leader>pn` | Phpactor new class (PHP) |

### Code Actions

| Shortcut | Action |
|----------|--------|
| `:Format` | Format document |

## Completion (nvim-cmp)

| Shortcut | Action |
|----------|--------|
| `Tab` | Select next completion / expand snippet |
| `Shift+Tab` | Select previous completion / jump backwards |
| `Enter` | Confirm selection |
| `Ctrl+Space` | Trigger completion |

### Completion Sources

- nvim_lsp - Language server suggestions
- nvim_lsp_signature_help - Function parameter hints
- luasnip - Snippets
- buffer - Current buffer
- path - File paths

## Snippets (LuaSnip)

| Shortcut | Action |
|----------|--------|
| `Tab` | Expand snippet |
| `Tab` (in snippet) | Jump to next placeholder |
| `Shift+Tab` | Jump to previous placeholder |

## Git Integration

### Fugitive

| Shortcut | Action |
|----------|--------|
| `:Git` | Git status (new window) |

### Gitsigns

| Shortcut | Action |
|----------|--------|
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `gs` | Stage hunk |
| `gS` | Undo stage hunk |
| `gp` | Preview hunk |
| `gb` | Blame line |

## Testing (vim-test)

| Shortcut | Action |
|----------|--------|
| `<leader>tn` | Test nearest |
| `<leader>tf` | Test file |
| `<leader>ts` | Test suite |
| `<leader>tl` | Test last |
| `<leader>tv` | Visit test file |

## Text Objects

| Shortcut | Target |
|----------|--------|
| `if` | Inner function |
| `af` | Outer function |
| `ia` | Inner parameter |
| `aa` | Outer parameter |

## Status Line (lualine)

The status line shows:
- **Left**: Mode, branch, diff, LSP clients count, diagnostics
- **Center**: Filename
- **Right**: File type, encoding, format, indentation, location

## Tab Line (bufferline)

Shows open buffers as tabs with:
- Slanted separators
- Modified indicator (⍰)
- Custom left area with icon

## PHP-Specific Features

### Projectionist

Configured for Laravel projects:

| File Type | Alternate |
|-----------|-----------|
| app/*.php | tests/Unit/{}.php, tests/Feature/{}.php |
| tests/Feature/*.php | app/{}.php |
| tests/Unit/*.php | app/{}.php |

### Commands

| Command | Action |
|---------|--------|
| `:A` | Switch to alternate file (test↔source) |
| `:AS` | Split and switch to alternate |
| `:ART` | Run artisan serve |
| `:ARTinker` | Open artisan tinker |

## AI Completion (Codeium)

Codeium provides AI-powered autocomplete. Sign up at https://codeium.com and get your API key.

## Theme

Uses **rose-pine** color scheme.

## Tmux Integration

Use `Ctrl+h/j/k/l` to navigate between tmux panes and vim windows seamlessly (requires vim-tmux-navigator).
