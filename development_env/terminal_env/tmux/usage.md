# Tmux Usage Guide

## Prefix Key

The default prefix is `Ctrl+b`.

## Default Key Bindings

### Session Management

| Shortcut | Action |
|----------|--------|
| `Prefix + C-c` | Create new session |
| `Prefix + C-f` | Find session |
| `Prefix + Tab` | Switch to last session |

### Window Management

| Shortcut | Action |
|----------|--------|
| `Prefix + C-h` | Previous window |
| `Prefix + C-l` | Next window |
| `Prefix + Tab` | Last active window |

### Pane Management

| Shortcut | Action |
|----------|--------|
| `Prefix + -` | Split horizontally |
| `Prefix + _` | Split vertically |
| `Prefix + h` | Move left (repeatable) |
| `Prefix + j` | Move down (repeatable) |
| `Prefix + k` | Move up (repeatable) |
| `Prefix + l` | Move right (repeatable) |
| `Prefix + H` | Resize left 2 cells |
| `Prefix + J` | Resize down 2 cells |
| `Prefix + K` | Resize up 2 cells |
| `Prefix + L` | Resize right 2 cells |
| `Prefix + <` | Swap with previous pane |
| `Prefix + >` | Swap with next pane |
| `Prefix + +` | Maximize current pane |

### Copy Mode

| Shortcut | Action |
|----------|--------|
| `Prefix + Enter` | Enter copy mode |
| `v` | Begin selection (vi mode) |
| `Ctrl+v` | Rectangle toggle (vi mode) |
| `y` | Copy selection (vi mode) |
| `Escape` | Cancel selection (vi mode) |
| `H` | Start of line (vi mode) |
| `L` | End of line (vi mode) |

### Clipboard Integration

| Shortcut | Action |
|----------|--------|
| `y` (in copy mode) | Copy to X11/Wayland/macOS/Windows clipboard |

### Buffers

| Shortcut | Action |
|----------|--------|
| `Prefix + b` | List paste buffers |
| `Prefix + p` | Paste from top buffer |
| `Prefix + P` | Choose buffer to paste |

### Other

| Shortcut | Action |
|----------|--------|
| `Prefix + r` | Reload configuration |
| `Prefix + e` | Edit configuration |
| `Prefix + m` | Toggle mouse mode |
| `Prefix + C-l` | Clear screen and history |

## Mouse Mode

Mouse mode is enabled by default:
- Click to select panes
- Scroll to scrollback
- Click window buttons to switch windows
- Drag pane borders to resize

Toggle with: `Prefix + m`

## Theme

Uses **Catppuccin** theme with automatic session renaming showing current path.

## Status Line

Shows:
- Session name
- Window list with automatic rename
- Current path
- Active pane indicator

## Plugins

### tmux-resurrect

| Action | Command |
|--------|---------|
| Save session | `Prefix + Ctrl-s` |
| Restore session | `Prefix + Ctrl-r` |

Restores:
- All sessions, windows, and panes
- Running programs (including nvim sessions)
- Current working directories

### tmux-yank

- Enhanced yank functionality
- Automatic clipboard integration
- Supports X11, Wayland, macOS, and Windows

### tmux-sensible

Provides sensible defaults including:
- History limit: 5000 lines
- Repeat time: 600ms
- Focus events: enabled
- Automatic rename: enabled
- Renumber windows: enabled

## Configuration File Location

The configuration is loaded from `~/.config/tmux/tmux.conf`.

Local overrides can be added to `~/.config/tmux/.local` (automatically sourced).

## Tips

1. **Quick navigation**: Use `Ctrl+h/j/k/l` for pane navigation (requires vim-tmux-navigator plugin in nvim)

2. **Session persistence**: Use `Prefix + Ctrl-s` to save your tmux state. It will persist across reboots.

3. **Copy to clipboard**: Simply press `y` in copy mode to copy to system clipboard.

4. **Window navigation**: Use `Prefix + Tab` to quickly switch back to the last active window.

5. **Nested tmux**: If running tmux inside tmux, use `Prefix + C-a` as the inner prefix.
