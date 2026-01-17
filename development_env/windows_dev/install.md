# Windows Development Environment Installation Guide

## Prerequisites

- Windows 10 or 11
- Administrator access (for font installation)
- Internet connection

## Installation Steps

### 1. Install Windows Terminal

**Method 1: Microsoft Store (Recommended)**
1. Open Microsoft Store
2. Search for "Windows Terminal"
3. Click "Get" to install

**Method 2: Winget**
```powershell
winget install --id=Microsoft.WindowsTerminal -e
```

**Method 3: Manual**
1. Download from https://github.com/microsoft/terminal/releases
2. Run the installer

### 2. Install PowerShell 7+

Windows Terminal includes PowerShell by default, but for the best experience:

```powershell
winget install --id=Microsoft.PowerShell -e
```

### 3. Install Nerd Font

The configuration uses **CaskaydiaCove Nerd Font** for icons and symbols.

1. Download from https://www.nerdfonts.com/font-downloads
2. Select "Caskaydia Cove" or "Cascadia Code"
3. Extract the downloaded zip file
4. Select all `.ttf` files
5. Right-click and select "Install" or "Install for all users"

### 4. Install Oh My Posh

**Using Winget:**
```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

**Using PowerShell (Admin):**
```powershell
Install-Module oh-my-posh -Scope CurrentUser -Force
```

### 5. Configure Windows Terminal

1. Open Windows Terminal
2. Press `Ctrl + ,` to open settings
3. Copy the contents of `powershell_configs/win_terminal_settings.json`
4. Replace the entire content of your settings.json
5. Save and close

### 6. Configure PowerShell Profile

1. Open PowerShell 7+ in Windows Terminal
2. Create profile if it doesn't exist:
```powershell
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}
```

3. Edit the profile:
```powershell
notepad $PROFILE
```

4. Add Oh My Posh initialization:
```powershell
oh-my-posh init pwsh --config 'C:\path\to\ohmyposhv3-v2.json' | Invoke-Expression
```

**Important:** Replace the path with the actual path to your `ohmyposhv3-v2.json` file.

5. Save and close the profile

### 7. Install Additional Tools (Optional)

**Git:**
```powershell
winget install -e --id Git.Git
```

**Node.js:**
```powershell
winget install -e --id OpenJS.NodeJS.LTS
```

**PHP:**
```powershell
winget install -e --id PHP.PHP
```

**Composer:**
```powershell
winget install -e --id Composer.Composer
```

**VS Code:**
```powershell
winget install -e --id Microsoft.VisualStudioCode
```

### 8. Install VSCode Extensions (Optional)

Open VSCode and install:
- `vscode-icons` (or Nerd Font icons)
- `Prettier` (formatter)
- `ESLint`
- `Vetur` (Vue) or `Vue - Official`
- `PHP Intelephense`
- `Tailwind CSS IntelliSense`

### 9. Restart Terminal

Close all Windows Terminal windows and reopen to apply changes.

## Configuration Files Included

| File | Purpose |
|------|---------|
| `win_terminal_settings.json` | Windows Terminal configuration |
| `settings.json` | Additional terminal settings |
| `ohmyposhv3-v2.json` | Oh My Posh theme |

## Windows Terminal Profiles

The configuration includes:

| Profile | Description |
|---------|-------------|
| PowerShell | PowerShell 7+ (default) |
| Windows PowerShell | Legacy PowerShell 5.1 |
| Ubuntu | WSL Ubuntu |
| Command Prompt | Legacy cmd.exe |
| Azure Cloud Shell | Azure Cloud Shell |
| Developer Command Prompt | VS 2019/2022 |
| Developer PowerShell | VS 2019/2022 |
| Bash | Git Bash |

## Color Schemes Available

The configuration includes these color schemes:
- Campbell
- Campbell Powershell
- One Half Dark
- One Half Light
- Solarized Dark
- Solarized Light
- Tango Dark
- Tango Light
- Ubuntu-ColorScheme
- Vintage (used for Ubuntu profile)

## Verification

1. Open Windows Terminal
2. Check that:
   - Font displays correctly (icons, symbols)
   - Oh My Posh prompt appears with git status
   - Theme colors match your selection
   - Tabs work correctly
   - Split panes work (`Alt+Shift+D`)

## Troubleshooting

### Font not displaying icons
- Ensure Nerd Font is installed
- Check terminal font settings
- Restart terminal after font installation

### Oh My Posh not loading
- Verify profile path in `$PROFILE`
- Run `oh-my-posh --print-primary` to test theme
- Check PowerShell execution policy

### Colors not correct
- Verify color scheme in settings.json
- Check profile-specific color overrides

### Profile not found
- Ensure `$PROFILE` path is correct
- Run `$PROFILE | Format-List -Force` to see all profile locations

### Winget not available
- Update Windows 10/11 to latest version
- Or download installers manually from respective websites
