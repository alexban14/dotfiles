require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'vim', 'vimdoc', 'go', 'rust', 'c', 'cpp', 'javascript', 'typescript', 'html', 'css', 'json', 'yaml', 'markdown' },
  ignore_install = { 'hoon' }, -- Skip the hoon parser
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  context_commentstring = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['if'] = '@function.inner',
        ['af'] = '@function.outer',
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
      },
    }
  }
})
