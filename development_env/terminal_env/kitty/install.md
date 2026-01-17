# Kitty Terminal Installation Guide

## Prerequisites

- A Unix-like system (Linux, macOS)
- Git (for cloning this repository)

## Installation

### 1. Install Kitty

**Linux (Ubuntu/Debian):**
```bash
sudo apt install kitty
```

**macOS (Homebrew):**
```bash
brew install --cask kitty
```

**From source:**
```bash
git clone https://github.com/kovidgoyal/kitty
cd kitty
make
sudo make install
```

### 2. Install Nerd Font

The configuration uses JetBrains Mono Nerd Font and termius for icons.

1. Download **JetBrains Mono Nerd Font** from https://www.nerdfonts.com/font-downloads
2. Install the font on your system:
   - Linux: Copy `.ttf` files to `~/.local/share/fonts/` and run `fc-cache -fv`
   - macOS: Double-click the font files and click "Install Font"

### 3. Link Configuration

Create a symlink to use this configuration:

```bash
mkdir -p ~/.config/kitty
ln -s /path/to/development_env/terminal_env/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s /path/to/development_env/terminal_env/kitty/my_kitty.conf ~/.config/kitty/my_kitty.conf
ln -s /path/to/development_env/terminal_env/kitty/current-theme.conf ~/.config/kitty/current-theme.conf
```

### 4. Reload Configuration

Press `Ctrl+Shift+F5` in Kitty to reload the configuration.

## Additional Theme Files

The configuration directory includes several theme files:
- `current-theme.conf` - One Dark theme
- `secondary-theme.conf` - Alternative theme
- `suse_kitty.conf` - SUSE-specific theme
- `backup-kitty.conf` - Backup configuration

## Verification

Open a new Kitty terminal window and verify:
- Font should be JetBrains Mono Nerd Font
- Colors should match the One Dark theme
- Tab bar should be at the top with powerline style
