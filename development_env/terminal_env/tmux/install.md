# Tmux Installation Guide

## Prerequisites

- Tmux >= 2.4 (recommended: 3.0+)
- Git
- Bash or Zsh

## Installation

### 1. Install Tmux

**Linux (Ubuntu/Debian):**
```bash
sudo apt install tmux
```

**macOS (Homebrew):**
```bash
brew install tmux
```

**From source:**
```bash
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make
sudo make install
```

### 2. Install TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

### 3. Link Configuration

```bash
mkdir -p ~/.config/tmux
ln -s /path/to/development_env/terminal_env/tmux/my_tmux.conf ~/.config/tmux/tmux.conf
```

### 4. Install Plugins

1. Start a new tmux session:
```bash
tmux
```

2. Press `Prefix + I` (capital I, as in "Install") to install plugins

3. Plugins will be installed to `~/.config/tmux/plugins/`

### 5. Reload Configuration

```bash
tmux source ~/.config/tmux/tmux.conf
```

## Plugins Installed

The configuration includes these TPM plugins:

| Plugin | Purpose |
|--------|---------|
| tpm | Plugin manager |
| tmux-sensible | Sensible default settings |
| catppuccin/tmux | Beautiful theme |
| tmux-resurrect | Save and restore sessions |
| tmux-yank | Enhanced clipboard support |

### Plugin Configuration

**tmux-resurrect:**
- Restores nvim sessions
- Strategy for nvim: 'session'

**tmux-yank:**
- Action: copy-pipe (copies to clipboard)

## Optional: Install tmux-continuum

For automatic session saving/restoration, you can enable tmux-continuum (currently disabled in config):

1. Uncomment the plugin in tmux.conf:
```tmux
set -g @plugin 'tmux-plugins/tmux-continuum'
```

2. Enable auto-restore:
```tmux
set -g @continuum-boot 'on'
set -g @continuum-restore 'on'
```

## System Dependencies

For full functionality, ensure these tools are installed:

| Tool | Purpose |
|------|---------|
| xsel/xclip | X11 clipboard support |
| wl-clipboard | Wayland clipboard support |
| pbcopy | macOS clipboard |
| clip.exe | Windows clipboard |

**Linux:**
```bash
sudo apt install xsel xclip
```

**Wayland:**
```bash
sudo apt install wl-clipboard
```

## Verification

1. Start tmux: `tmux`
2. Check plugin status: `Prefix + I`
3. Verify theme: Colors should match catppuccin theme
4. Test mouse mode: Click and scroll should work
5. Test copy mode: Enter copy mode and try yanking

## Troubleshooting

### Plugins not installing
- Ensure TPM is installed at `~/.config/tmux/plugins/tpm`
- Press `Prefix + I` to install

### Colors not displaying correctly
- Ensure `TERM` is set to `screen-256color` or `tmux-256color`
- Add to `.bashrc` or `.zshrc`:
```bash
export TERM=screen-256color
```

### Clipboard not working
- Check which clipboard tool is available: `which xsel`, `which xclip`, `which wl-copy`
- Ensure the appropriate binding is uncommented in config
