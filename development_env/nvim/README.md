# Neovim Configuration Guide

This guide provides a detailed overview of the plugins and key mappings configured in this Neovim setup. All keybindings are for **Normal Mode**.

## Leader Key

The leader key is set to the **space bar**. In the key mappings below, `<leader>` refers to the space bar. For example, `<leader>pv` means pressing `Space` then `p` then `v`.

```lua
vim.g.mapleader = " "
```

## Key Binding Notation

The following notation is used to describe key combinations:

-   `<C-k>`: Press the **Ctrl** key and the **k** key at the same time. For example, `<C-e>` means `Ctrl + e`.
-   `<leader>`: Refers to the leader key, which is the **space bar**.
-   `<CR>`: Represents the **Enter** key.
-   `<Space>`: Represents the **Spacebar** key.

## Installed Plugins

This configuration uses the following plugins, managed by [packer.nvim](https://github.com/wbthomason/packer.nvim):

-   **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: A highly extendable fuzzy finder over lists.
-   **[rose-pine](https://github.com/rose-pine/neovim)**: A color scheme.
-   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides better syntax highlighting and code analysis.
-   **[harpoon](https://github.com/ThePrimeagen/harpoon)**: A file marking and navigation tool.
-   **[undotree](https://github.com/mbbill/undotree)**: A visual undo tree.
-   **[vim-fugitive](https://github.com/tpope/vim-fugitive)**: A Git wrapper.
-   **[lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)**: A pre-configured LSP setup.
-   **[mason.nvim](https://github.com/williamboman/mason.nvim)**: Manages LSP servers, DAP servers, linters, and formatters.
-   **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)**: Bridges mason.nvim and lspconfig.
-   **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: A completion engine.
-   **[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)**: LSP source for nvim-cmp.
-   **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: A snippet engine.

## Key Mappings

### General

| Keybinding  | Action                                                                  |
| :---------- | :---------------------------------------------------------------------- |
| `<leader>pv`| **Open File Explorer**: Opens a simple file explorer (`:Ex`) in a vertical split. This is useful for quickly navigating the file system and opening files without leaving Neovim. |

### Telescope

Telescope is a powerful fuzzy finder. You can start typing to filter the list of items in real-time.

| Keybinding  | Action                                                                  |
| :---------- | :---------------------------------------------------------------------- |
| `<leader>pf`| **Find Files**: Opens a Telescope window to fuzzy find files in the current working directory. This is a very fast way to open any file in your project. |
| `<C-p>`     | **Find Git Files**: Similar to "Find Files", but only shows files that are tracked by Git. This is useful for ignoring temporary files or files in your `.gitignore`. |
| `<leader>ps`| **Grep String**: Prompts for a search term and performs a project-wide search for that string. The results are displayed in a Telescope window, and selecting a result will jump to that line in the corresponding file. |

### Harpoon

Harpoon is like a bookmarking system for your files. You can "harpoon" a file to add it to a list, and then quickly jump back to it from anywhere.

| Keybinding  | Action                                                                  |
| :---------- | :---------------------------------------------------------------------- |
| `<leader>a` | **Add File**: Marks the current file and adds it to the Harpoon list. This is useful for files you frequently access. |
| `<C-e>`     | **Toggle Quick Menu**: Shows the Harpoon menu, which is a list of your marked files. You can select a file from this menu to navigate to it. |
| `<C-h>`     | **Navigate to File 1**: Jumps directly to the first file in your Harpoon list. |
| `<C-t>`     | **Navigate to File 2**: Jumps directly to the second file in your Harpoon list. |
| `<C-n>`     | **Navigate to File 3**: Jumps directly to the third file in your Harpoon list. |
| `<C-s>`     | **Navigate to File 4**: Jumps directly to the fourth file in your Harpoon list. |

### Fugitive

Fugitive allows you to use Git without leaving Neovim.

| Keybinding  | Action                                                                  |
| :---------- | :---------------------------------------------------------------------- |
| `<leader>gs`| **Git Status**: Opens a new buffer with the output of `git status`. In this buffer, you can press `s` on a file to stage or unstage it, `c` to commit, `p` to push, and much more. |

### Undotree

Undotree gives you a visual representation of your undo history, making it easier to go back to a previous state.

| Keybinding  | Action                                                                  |
| :---------- | :---------------------------------------------------------------------- |
| `<leader>u` | **Toggle Undotree**: Opens and closes the Undotree panel. This panel shows a graph of all your changes (your undo history). You can move through the graph and press `Enter` to jump back to a specific state. |

### LSP & Autocompletion (nvim-cmp)

These keybindings help you work with code suggestions provided by the Language Server Protocol (LSP) and `nvim-cmp`.

| Keybinding  | Action                                                                  |
| :---------- | :---------------------------------------------------------------------- |
| `<C-p>`     | **Select Previous Item**: When the autocompletion menu is open, this moves your selection up to the previous suggestion. |
| `<C-n>`     | **Select Next Item**: When the autocompletion menu is open, this moves your selection down to the next suggestion. |
| `<C-y>`     | **Confirm Selection**: This confirms the currently highlighted suggestion in the autocompletion menu and inserts it into your code. |
| `<C-Space>` | **Trigger Completion**: If the autocompletion menu is not visible, this will manually trigger it to show available suggestions. |

### Treesitter

Treesitter creates a more intelligent syntax tree of your code, allowing for more advanced text objects. A "text object" is a way to select a block of text, like a function or a parameter.

| Keybinding | Action                                                                  |
| :--------- | :---------------------------------------------------------------------- |
| `if`       | **Select Inner Function**: In visual mode, this selects the content *inside* the current function. For example, you could use `vif` to visually select the body of a function. |
| `af`       | **Select Outer Function**: In visual mode, this selects the *entire* current function, including its name and parameters. For example, `vaf` will select the whole function block. |
| `ia`       | **Select Inner Parameter**: In visual mode, this selects the content *inside* the current parameter. |
| `aa`       | **Select Outer Parameter**: In visual mode, this selects the *entire* current parameter. |

## General Settings

The following settings are configured in `lua/banalexandru/set.lua`:

-   **Line numbers**: Relative line numbers are enabled to make vertical navigation easier.
-   **Tabs and indentation**: Tabs are set to 4 spaces and are expanded to spaces. Smart indent is enabled to automatically indent new lines.
-   **Word wrap**: Disabled to prevent lines from wrapping.
-   **Swap and backup files**: Disabled to avoid creating extra files.
-   **Undo file**: Enabled, so your undo history is preserved even after you close and reopen a file.
-   **Search**: Search result highlighting is disabled, but incremental search (showing matches as you type) is enabled.
-   **Colors**: True color support is enabled for a better visual experience.
-   **Scrolling**: Scrolling starts 8 lines from the top or bottom of the screen, providing more context.
-   **Color column**: A vertical line is shown at 80 characters to encourage keeping lines short.
-   **Update time**: The time (in milliseconds) to wait before flushing writes to disk.
-   **Sign column**: The column on the left for signs (e.g., from Git or LSP) is always shown.