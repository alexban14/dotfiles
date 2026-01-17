# Kitty Terminal Usage Guide

## Default Features

### Fonts
- **Font Family**: JetBrains Mono Regular Nerd Font Complete
- **Bold Font**: JetBrains Mono Bold Nerd Font Complete
- **Italic Font**: JetBrains Mono Italic Nerd Font Complete
- **Font Size**: 12
- **Line Height**: 125%

### Window Settings
- Cursor blink: Off
- Audio bell: Disabled
- Window decorations: Hidden
- Window padding: 10px
- Initial size: 1000x600
- Scrollback: Unlimited

### Colors
- Theme: One Dark (by Giuseppe Cesarano)
- Foreground: #979eab
- Background: #282c34

## Keyboard Shortcuts

### Tab Navigation
| Shortcut | Action |
|----------|--------|
| `Ctrl+PageDown` | Next tab |
| `Ctrl+PageUp` | Previous tab |
| `Ctrl+Shift+PageDown` | Move tab forward |
| `Ctrl+Shift+PageUp` | Move tab backward |

### Window Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+T` | New tab with current directory |
| `Ctrl+Shift+Enter` | New window with current directory |

### Layouts
| Shortcut | Action |
|----------|--------|
| `Ctrl+[` | Decrease full-size windows in tall layout |
| `Ctrl+]` | Increase full-size windows in tall layout |

### Configuration
| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+F5` | Reload configuration |

## Configuration File Structure

The main configuration is split across files:

1. **kitty.conf** - Main configuration with base settings and Draclua theme
2. **my_kitty.conf** - Alternative configuration with One Dark theme
3. **current-theme.conf** - Theme file included by my_kitty.conf

## Environment Variables

The configuration automatically includes any `.conf` files from the `kitty.d/` subdirectory.

## Cursor and Selection
- Cursor shape: Block
- Cursor color: #8fee96
- Selection foreground: #000000
- Selection background: #F5FBFF

## Terminal Compatibility
- Terminal type: xterm-256color
- Linux display server: X11
- Ligatures: Disabled (rendered as cursor)

## Tab Bar
- Position: Top
- Style: Powerline
- Powerline style: Slanted
- Activity symbol: 🔻
