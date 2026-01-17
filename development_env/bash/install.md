# Bash Configuration Installation Guide

## Prerequisites

- Bash >= 4.0 (for advanced features)
- Git
- NVM (Node Version Manager) - optional but recommended

## Installation

### 1. Install NVM (Node Version Manager)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

This will install NVM to `~/.nvm` and add the following to your `.bashrc`:
```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```

### 2. Link Configuration

```bash
# Backup existing bashrc if it exists
cp ~/.bashrc ~/.bashrc.backup

# Link new configuration
ln -s /path/to/development_env/bash/bashrc_config ~/.bashrc
```

### 3. Restart Shell

```bash
source ~/.bashrc
```

## Features

### History Settings

- Ignores duplicate lines and lines starting with space
- Appends to history (doesn't overwrite)
- History size: 1000 lines
- History file size: 2000 lines

### Aliases

| Alias | Command |
|-------|---------|
| `ll` | `ls -alF` |
| `la` | `ls -A` |
| `l` | `ls -CF` |
| `alert` | Notifications for long-running commands |

### Color Support

Automatically enables color support for:
- `ls` command
- `grep`, `fgrep`, `egrep`
- `dir`, `vdir` (if enabled)

### Terminal Title

Sets xterm/rxvt terminal titles to: `user@host:directory`

### Shell Options

- `histappend`: Append to history file
- `checkwinsize`: Update LINES/COLUMNS after each command
- `globstar`: Disabled (can be enabled for `**` globbing)

### NVM Integration

The configuration automatically loads:
- NVM
- NVM bash completion
- Allows using multiple Node.js versions

## Directory Colors

The configuration uses `~/.dircolors` for `ls` color customization. Create one if needed:

```bash
dircolors -p > ~/.dircolors
```

## Optional: Bash Completion

Bash completion is automatically loaded from:
- `/usr/share/bash-completion/bash_completion` (Debian/Ubuntu)
- `/etc/bash_completion` (other distributions)

## Verification

1. Open a new terminal
2. Run `alias` to verify aliases are loaded
3. Run `nvm --version` to verify NVM is loaded
4. Run `ls -la` to verify colors work
5. Run `echo $HISTFILE` to verify history file

## Troubleshooting

### No colors in ls
Ensure `~/.dircolors` exists or the fallback is working:
```bash
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
```

### NVM not loading
Ensure the NVM installation script was run and the exports are in `~/.bashrc`.

### Slow startup
The completion loading might be slow on some systems. This is normal.

### HISTSIZE not taking effect
Ensure the file is sourced after login shells or manually source it:
```bash
source ~/.bashrc
```
