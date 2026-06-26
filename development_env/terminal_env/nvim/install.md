# Neovim Installation Guide

## Prerequisites

- Neovim >= 0.11 (required for the `vim.lsp.config`/`vim.lsp.enable` API; 0.12+ recommended)
- Git
- A C compiler (for nvim-treesitter parsers) and `tree-sitter` CLI
- Node.js + npm (for several LSP servers) and `ripgrep` (Telescope grep)
- A terminal emulator with true color support
- Nerd Font (for icons)

> Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which
> bootstraps itself on first launch. Exact plugin versions are pinned in
> `lazy-lock.json`.

## Installation

### 1. Install Neovim

**Linux (Ubuntu/Debian):**
```bash
sudo apt install neovim
```

**macOS (Homebrew):**
```bash
brew install neovim
```

**From source:**
```bash
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
```

**Windows (Scoop or Chocolatey):**
```powershell
scoop install neovim
# or
choco install neovim
```

### 2. Install Ripgrep

Ripgrep is required for Telescope grep functionality:

**Linux:**
```bash
sudo apt install ripgrep
```

**macOS:**
```bash
brew install ripgrep
```

### 3. Install Node.js and npm

Required for some LSP servers:

```bash
# Using nvm (recommended)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install --lts
nvm use --lts
```

### 4. Install PHP and Composer

Required for PHP development:

**Linux:**
```bash
sudo apt install php php-cli composer
```

**macOS:**
```bash
brew install php composer
```

### 5. Link Configuration

Symlink the whole config directory:

```bash
ln -s /path/to/development_env/terminal_env/nvim ~/.config/nvim
```

### 6. Install Plugins

1. Open Neovim:
```bash
nvim
```

2. On first launch, lazy.nvim bootstraps itself and installs every plugin
   automatically. Treesitter parsers build via `:TSUpdate` during this step.

3. Useful commands:
   - `:Lazy` — open the plugin manager UI
   - `:Lazy sync` — install/clean/update to match the spec + lockfile
   - `:Lazy restore` — install the exact versions pinned in `lazy-lock.json`

4. Restart Neovim.

### 7. Install Mason LSP Servers

The configuration enables these servers (install them via `:Mason` if missing):

   - intelephense (PHP)
   - vue-language-server (`vue_ls`) + typescript-language-server (`ts_ls`) — Vue
     uses Volar 2.x hybrid mode, where `ts_ls` loads the `@vue/typescript-plugin`
     shipped inside the vue-language-server package
   - tailwindcss-language-server (`tailwindcss`)
   - json-lsp (`jsonls`)
   - lua-language-server (`lua_ls`)
   - eslint_d + prettierd (used by none-ls for diagnostics/formatting)

### 8. Install Language Tools

**PHP:**
- Ensure PHP and Composer are installed
- Phpactor will be installed automatically via Mason

**Vue/JavaScript/TypeScript:**
- Ensure Node.js is installed
- Volar will be installed via Mason

**Testing (PHP):**
- Install PHPUnit globally or per project:
```bash
composer global require phpunit/phpunit
```

## Verification

1. Open a file in Neovim
2. Check that:
   - LSP diagnostics appear
   - Completion works with `Tab`
   - Telescope can search files with `<leader>pf`
   - Nvim-Tree opens with `<leader>ft`
   - Buffer navigation works with `<leader>1`, `<leader>2`, etc.

## Troubleshooting

### Colors not appearing
Ensure your terminal supports true color and you have:
```bash
export TERM=xterm-256color
```

### LSP not working
Run `:checkhealth vim.lsp` (or `:LspInfo`) to check LSP status.

### Plugins not loading
Run `:Lazy` to check plugin status, or `:Lazy sync` to repair.

### Icons not displaying
Install a Nerd Font and set it in your terminal.
