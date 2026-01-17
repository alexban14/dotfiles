# Windows Development Environment Usage Guide

## Terminal Shortcuts

### Global Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+F` | Open find dialog |
| `Ctrl+C` | Copy (as plain text) |
| `Ctrl+V` | Paste |
| `Alt+Shift+D` | Split pane (duplicate current profile) |

### Tab Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+Tab` | Next tab |
| `Ctrl+Shift+Tab` | Previous tab |
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+W` | Close tab |

### Pane Shortcuts

| Shortcut | Action |
|----------|--------|
| `Alt+Arrow` | Navigate between panes |
| `Alt+Shift+Arrow` | Resize pane |
| `Ctrl+Shift+D` | Split pane horizontally |
| `Alt+Shift+-` | Split pane vertically |
| `Ctrl+Shift+P` | Close pane |

## Windows Terminal Profiles

### Available Profiles

1. **PowerShell** - Default profile (PowerShell 7+)
2. **Windows PowerShell** - Legacy PowerShell 5.1
3. **Ubuntu** - WSL Ubuntu distribution
4. **Command Prompt** - Legacy cmd.exe
5. **Azure Cloud Shell** - Cloud-based shell
6. **Developer Command Prompt** - VS 2019/2022
7. **Developer PowerShell** - VS 2019/2022
8. **Bash** - Git for Windows Bash

### Profile Settings

**Default Font:** CaskaydiaCove Nerd Font
**Default Size:** Configured in settings
**Opacity:** 85%
**Acrylic:** Disabled

## Oh My Posh Theme Features

The custom theme (`ohmyposhv3-v2.json`) displays:

### Left Segment: Path
- Icon:  (folder symbol)
- Style: Diamond
- Color: White on Pink (#ff479c)

### Second Segment: Git Status
- Shows branch name
- Status indicators (staged, unstaged, untracked)
- Stash count
- Upstream icon
- Colors: Yellow background, dark text

### Third Segment: .NET
- Shows .NET version
- Icon: 
- Color: Green background

### Fourth Segment: Root Indicator
- Shows when running as administrator
- Color: Yellow background

### Final Segment: Exit Code
- Shows last command exit status
- Icon: 
- Always enabled
- Color: Teal background
- Error color: Red (#f1184c)

## Command Prompt Features

### Git Integration

The prompt automatically shows:
- Current branch name
- Git status indicators:
  - `+` = staged changes
  - `~` = unstaged changes
  - `$` = stashed changes
  - `⇅` = unpushed/unpulled commits

### Working Directory

- Shows current folder name
- Full path available on hover
- Console title updates to show folder name

### Exit Codes

- Visual feedback on command failure
- Last exit code displayed in prompt
- Different colors for success/failure

## PowerShell Modules

The profile may include these common PowerShell modules:

```powershell
# Check installed modules
Get-Module -ListAvailable
```

### Common Commands

| Command | Description |
|---------|-------------|
| `Get-ChildItem` | List files (aliased as `ls`, `dir`) |
| `Set-Location` | Change directory (aliased as `cd`) |
| `Copy-Item` | Copy files (aliased as `cp`) |
| `Move-Item` | Move files (aliased as `mv`) |
| `Remove-Item` | Delete files (aliased as `rm`, `del`) |
| `Get-Content` | Read file (aliased as `cat`, `type`) |

## WSL Integration

If using Ubuntu WSL profile:

### Common Commands

| Command | Description |
|---------|-------------|
| `wsl` | Run WSL command from Windows |
| `wsl ls` | List files in WSL |
| `wsl -e bash` | Run bash in WSL |
| `wsl shutdown` | Shutdown WSL |

### Accessing Windows Files

```powershell
# From WSL
cd /mnt/c/Users/YourName/Documents

# From PowerShell
wsl ls /home/youruser
```

## Developer Tools

### Git Bash

The Git Bash profile provides:
- Linux-like commands on Windows
- Git integration
- SSH access
- Package managers (if installed)

### VS Developer Prompts

These profiles automatically load Visual Studio development environment:
- Compiler paths (cl.exe)
- SDK paths
- Build tools

## Tips and Tricks

### 1. Multiple Tabs
Use `Ctrl+Shift+T` to open new tabs with the default profile.

### 2. Paste as Plain Text
The configuration is set to paste without formatting.

### 3. Copy on Select
Copy on select is disabled - use `Ctrl+C` or right-click to copy.

### 4. Transparency
The terminal uses 85% opacity with no acrylic for better performance.

### 5. Restore Previous Session
Windows Terminal 1.12+ supports restoring previous tabs.

### 6. Color Scheme Switching
Run `oh-my-posh theme` to preview themes, then update your profile.

## Customization

### Adding New Profiles

Edit `settings.json` and add to the `profiles.list` array:

```json
{
    "name": "My Custom Profile",
    "commandline": "powershell.exe -NoExit -Command \"...\"",
    "icon": "ms-appx:///Images/NewTab.png",
    "startingDirectory": "C:\\Users\\YourName"
}
```

### Changing Color Scheme

Update the profile in `settings.json`:

```json
{
    "colorScheme": "One Half Dark"
}
```

### Changing Font

Update `profiles.defaults.fontFace`:

```json
{
    "fontFace": "Your Nerd Font Name"
}
```

## Troubleshooting

### Slow Startup
- Disable unused profiles
- Reduce tab count
- Check for resource-heavy startup commands

### Font Issues
- Verify Nerd Font installation
- Check font name matches exactly
- Restart terminal after font changes

### Oh My Posh Not Loading
- Verify profile path is correct
- Check PowerShell execution policy
- Run `oh-my-posh --debug --pwd` to diagnose

### Colors Not Displaying
- Ensure terminal supports true color
- Check color scheme is properly defined
- Verify profile uses correct scheme

### Performance Issues
- Disable transparency effects
- Reduce scrollback buffer size
- Close unused tabs
