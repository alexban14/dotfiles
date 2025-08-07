# PowerShell Environment Setup Guide

This guide provides instructions on how to restore the PowerShell environment using the provided configuration files.

## 1. Prerequisites

*   **Windows Terminal**: This guide assumes you are using Windows Terminal. You can install it from the [Microsoft Store](https://aka.ms/terminal).

## 2. Nerd Font Installation

The terminal prompt is customized using `oh-my-posh`, which requires a Nerd Font to display special characters and glyphs correctly. The configuration is set up to use **CaskaydiaCove Nerd Font**.

1.  **Download the font**: Download the `CaskaydiaCove Nerd Font` from the [Nerd Fonts website](https://www.nerdfonts.com/font-downloads). Look for "Cascadia Code" or "Caskaydia Cove" and download the package.
2.  **Install the font**:
    *   Unzip the downloaded file.
    *   Select all the font files (e.g., `.ttf` files).
    *   Right-click on the selected files and choose "Install" or "Install for all users".

## 3. Windows Terminal Setup

The `win_terminal_settings.json` file contains the configuration for Windows Terminal, including profiles, color schemes, and the default font.

1.  **Open Windows Terminal settings**:
    *   Open Windows Terminal.
    *   Press `Ctrl + ,` (comma) to open the settings file (`settings.json`) in your default text editor.

2.  **Copy the configuration**:
    *   Open the `powershell_configs/win_terminal_settings.json` file provided in this repository.
    *   Copy the entire content of `win_terminal_settings.json`.
    *   Paste the copied content into your `settings.json` file, replacing the existing content.
    *   Save and close the `settings.json` file.

## 4. Oh My Posh Setup

`oh-my-posh` is a prompt theme engine that allows for the customized PowerShell prompt.

1.  **Install Oh My Posh**:
    *   Open a new PowerShell terminal.
    *   Run the following command to install `oh-my-posh` using `winget`:
        ```powershell
        winget install JanDeDobbeleer.OhMyPosh -s winget
        ```

2.  **Configure PowerShell Profile**:
    *   In your PowerShell terminal, open your PowerShell profile file by running:
        ```powershell
        notepad $PROFILE
        ```
    *   If the file does not exist, PowerShell will prompt you to create it. Click "Yes".

3.  **Add Oh My Posh to your profile**:
    *   Add the following line to your PowerShell profile file. This command initializes `oh-my-posh` and tells it to use your custom theme file.

        ```powershell
        oh-my-posh init pwsh --config 'C:\path\to\your\powershell_configs\ohmyposhv3-v2.json' | Invoke-Expression
        ```
    *   **Important**: Replace `C:\path\to\your\powershell_configs\` with the actual absolute path to the `powershell_configs` directory on your system.
    *   Save and close the profile file.

## 5. Final Steps

*   **Close and reopen** your PowerShell terminal for all the changes to take effect.

You should now see your new, customized PowerShell prompt.
