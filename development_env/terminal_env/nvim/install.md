# Neovim Installation Guide

## Prerequisites

- Neovim >= 0.8.0 (recommended: 0.9.0 or later)
- Git
- A terminal emulator with true color support
- Nerd Font (for icons)

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

```bash
mkdir -p ~/.config/nvim
ln -s /path/to/development_env/terminal_env/nvim/init.lua ~/.config/nvim/init.lua
ln -s /path/to/development_env/terminal_env/nvim/lua ~/.config/nvim/lua
```

### 6. Install Plugin Manager and Plugins

1. Open Neovim:
```bash
nvim
```

2. The first time you open Neovim, packer.nvim will be automatically installed.

3. Run the plugin installation command:
```bash
:PackerSync
```

4. Restart Neovim

### 7. Install Mason LSP Servers

The configuration uses Mason to automatically install LSP servers. Some manual setup may be needed:

1. Open Neovim
2. Run:
```bash
:Mason
```

3. Ensure these servers are installed:
   - intelephense (PHP)
   - volar (Vue/TS)
   - tailwindcss
   - jsonls
   - lua-language-server
   - eslintd
   - prettierd

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
Run `:LspInfo` to check LSP status.

### Plugins not loading
Run `:PackerStatus` to check plugin status.

### Icons not displaying
Install a Nerd Font and set it in your terminal.
