-- Bootstrap lazy.nvim (replaces packer.nvim).
-- See :help lazy.nvim.txt
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Leader must be set before lazy so plugin keymaps register correctly.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input('Grep > ') })
      end)
    end,
  },

  -- Colorscheme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      vim.cmd('colorscheme rose-pine')
    end,
  },

  -- Quick file navigation (harpoon v1 API)
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')
      vim.keymap.set('n', '<leader>a', mark.add_file)
      vim.keymap.set('n', '<leader><C-e>', ui.toggle_quick_menu)
      vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
      vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
      vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
      vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)
    end,
  },

  -- Git
  { 'tpope/vim-fugitive', dependencies = { 'tpope/vim-rhubarb' } },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
      vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
      vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
      vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
      vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
      vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
    end,
  },

  -- tpope & friends: editing quality-of-life
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-eunuch',
  'tpope/vim-unimpaired',
  'tpope/vim-sleuth',
  'tpope/vim-repeat',
  -- polyglot bundles its own vim-sleuth; disable it so it doesn't clash with the
  -- standalone tpope/vim-sleuth above (E741: g:loaded_sleuth is locked).
  {
    'sheerun/vim-polyglot',
    init = function()
      vim.g.polyglot_disabled = { 'autoindent' }
    end,
  },
  'christoomey/vim-tmux-navigator',
  'farmergreg/vim-lastplace',
  'nelstrom/vim-visual-star-search',
  'jessarcher/vim-heritage',

  -- Text objects for HTML attributes.
  { 'whatyouhide/vim-textobj-xmlattr', dependencies = { 'kana/vim-textobj-user' } },

  -- Set the working directory to the project root (run once at startup).
  {
    'airblade/vim-rooter',
    init = function()
      vim.g.rooter_manual_only = 1
    end,
    config = function()
      vim.cmd('Rooter')
    end,
  },

  -- Automatically add closing brackets, quotes, etc.
  { 'windwp/nvim-autopairs', config = true },

  -- Smooth scrolling.
  { 'karb94/neoscroll.nvim', config = true },

  -- Split/join arrays and methods across lines.
  {
    'AndrewRadev/splitjoin.vim',
    init = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_php_method_chain_full = 1
    end,
  },

  -- Fix indentation when pasting.
  {
    'sickill/vim-pasta',
    init = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  },

  -- File tree sidebar
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('banalexandru/plugins/nvim-tree')
    end,
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('banalexandru/plugins/lualine')
    end,
  },

  -- Buffers as tabs
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('banalexandru/plugins/bufferline')
    end,
  },

  -- Close buffers without closing the split.
  {
    'famiu/bufdelete.nvim',
    config = function()
      vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
    end,
  },

  -- Indentation guides + rainbow delimiters
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
    config = function()
      require('banalexandru/plugins/blankline')
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master', -- pin to legacy API (config uses require('nvim-treesitter.configs'))
    build = ':TSUpdate',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
      require('banalexandru/plugins/treesitter')
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
      'nvimtools/none-ls.nvim',
      'nvimtools/none-ls-extras.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require('banalexandru/plugins/lspconfig')
    end,
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
    },
    config = function()
      require('banalexandru/plugins/cmp')
    end,
  },

  -- PHP refactoring
  {
    'phpactor/phpactor',
    ft = 'php',
    build = 'composer install --no-dev --optimize-autoloader',
    config = function()
      vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
      vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
    end,
  },

  -- Project configuration
  {
    'tpope/vim-projectionist',
    dependencies = { 'tpope/vim-dispatch' },
    config = function()
      require('banalexandru/plugins/projectionist')
    end,
  },

  -- Test runner
  {
    'vim-test/vim-test',
    config = function()
      require('banalexandru/plugins/vim-test')
    end,
  },

  -- AI completion
  {
    'Exafunction/codeium.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' },
    config = function()
      require('codeium').setup({})
    end,
  },
}, {
  -- lazy.nvim options
  change_detection = { notify = false },
})
