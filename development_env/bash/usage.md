# Bash Usage Guide

## Core Features

### History Control

The configuration enhances bash history:

| Feature | Setting | Description |
|---------|---------|-------------|
| `ignoreboth` | HISTCONTROL | Ignores duplicates and space-prefixed commands |
| `histappend` | Enabled | Appends to history (doesn't overwrite) |
| `HISTSIZE` | 1000 | Lines stored in memory |
| `HISTFILESIZE` | 2000 | Lines stored in file |

### Directory Navigation

Standard bash shortcuts work as expected:
- `Ctrl+a` - Move to beginning of line
- `Ctrl+e` - Move to end of line
- `Ctrl+u` - Clear before cursor
- `Ctrl+k` - Clear after cursor
- `Ctrl+w` - Delete previous word
- `Ctrl+r` - Reverse search history

## Aliases

### File Listing

| Alias | Command | Description |
|-------|---------|-------------|
| `ll` | `ls -alF` | Long listing with type indicators |
| `la` | `ls -A` | All files (except . and ..) |
| `l` | `ls -CF` | Columnar with classification |

### Color-Enabled Commands

| Command | Description |
|---------|-------------|
| `ls` | Colorized output |
| `grep` | Colorized matches |
| `fgrep` | Colorized fixed-string matches |
| `egrep` | Colorized extended regex matches |

### Notification

| Alias | Description |
|-------|-------------|
| `alert` | Sends notification when previous command finishes |

Usage:
```bash
sleep 10; alert
```

## Prompt

### Color Prompt

For terminals with color support (`xterm-color` or `*-256color`):
```
\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
```

This displays:
- Green username@hostname
- Blue working directory
- Simple prompt character

### Non-Color Prompt

For basic terminals:
```
\u@\h:\w\$
```

### Terminal Title

For xterm/rxvt terminals, the title is set to: `user@host: directory`

## Shell Options

### checkwinsize

Automatically updates `LINES` and `COLUMNS` after each command, ensuring proper display.

### globstar (Disabled)

Can be enabled in `.bashrc` for recursive globbing:
```bash
shopt -s globstar
```
Then use `ls **/*.txt` to match recursively.

## NVM Integration

### Commands

| Command | Description |
|---------|-------------|
| `nvm install <version>` | Install specific Node.js version |
| `nvm use <version>` | Switch to version |
| `nvm list` | List installed versions |
| `nvm current` | Show current version |
| `nvm alias default <version>` | Set default version |

### Examples

```bash
# Install and use LTS
nvm install --lts
nvm use --lts

# Install specific version
nvm install 18

# List versions
nvm list

# Set default
nvm alias default 18
```

## Completion

Bash completion is enabled for:
- Git commands
- SSH hosts
- Package managers
- Other completions from `/etc/bash_completion`

## Environment Variables

| Variable | Value | Purpose |
|----------|-------|---------|
| `NVM_DIR` | `$HOME/.nvm` | NVM installation directory |
| `TERM` | (unchanged) | Terminal type detection |

## File Structure

The configuration is designed to be sourced from `~/.bashrc`:

```
~/.bashrc
  ├── ~/.bash_aliases (if exists)
  └── NVM initialization
```

## Tips

### 1. Use `!!` for last command
```bash
sudo !!
```

### 2. Use `!$` for last argument
```bash
mkdir newproject && cd !$
```

### 3. Reverse search with Ctrl+r
Type part of a previous command and press `Ctrl+r` repeatedly to cycle through matches.

### 4. Faster directory changes
```bash
cd -  # Go to previous directory
cd    # Go to home directory
```

### 5. Use `lesspipe` for file previews
The configuration automatically enables `lesspipe` for better file viewing in `less`.

## Troubleshooting

### Colors not working
Ensure your terminal emulator supports 256 colors and your `TERM` is set correctly.

### Aliases not working
Check that the file is properly sourced:
```bash
source ~/.bashrc
```

### NVM slow to load
NVM adds some startup time. Consider using a faster shell like zsh if this is an issue.

### History not saving
Ensure `HISTSIZE` and `HISTFILESIZE` are set correctly and you have write permissions to `~/.bash_history`.
