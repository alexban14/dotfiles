-- LSP setup using the Neovim 0.11+ framework: vim.lsp.config() to define
-- per-server settings and vim.lsp.enable() to turn them on. The old
-- require('lspconfig').<server>.setup({}) framework is deprecated.
-- See :help lspconfig-nvim-0.11

require('mason').setup()

-- mason-lspconfig v2 auto-enables every Mason-installed server by default.
-- We curate the list ourselves below, so disable the automatic behaviour.
require('mason-lspconfig').setup({
  automatic_enable = false,
})

-- nvim-cmp completion capabilities, applied to every server via the '*' config.
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
vim.lsp.config('*', { capabilities = capabilities })

-- PHP
vim.lsp.config('intelephense', {})

-- Tailwind CSS
vim.lsp.config('tailwindcss', {})

-- Lua (aware of the Neovim runtime so editing this config is clean)
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- JSON, with schemastore catalog
vim.lsp.config('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

-- Vue + TypeScript/JavaScript (Volar 2.x hybrid mode).
-- Volar dropped "take over mode"; instead ts_ls runs the @vue/typescript-plugin
-- shipped inside the vue-language-server Mason package, and vue_ls handles .vue.
local servers = { 'intelephense', 'tailwindcss', 'lua_ls', 'jsonls' }

local vue_ls_dir = vim.fn.stdpath('data')
  .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
local vue_ts_plugin = vue_ls_dir .. '/node_modules/@vue/typescript-plugin'

if (vim.uv or vim.loop).fs_stat(vue_ts_plugin) then
  vim.lsp.config('ts_ls', {
    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = vue_ts_plugin,
          languages = { 'vue' },
        },
      },
    },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
  })
  vim.lsp.config('vue_ls', {})
  vim.list_extend(servers, { 'ts_ls', 'vue_ls' })
else
  -- Vue plugin not installed: still give plain JS/TS support.
  vim.lsp.config('ts_ls', {})
  vim.list_extend(servers, { 'ts_ls' })
end

vim.lsp.enable(servers)

-- Diagnostics / formatting from non-LSP tools via none-ls.
local nonels_status, nonels = pcall(require, 'null-ls')
if nonels_status then
  -- eslint detection covers both flat config and legacy .eslintrc*.
  local eslint_root = function(utils)
    return utils.root_has_file({
      'eslint.config.js', 'eslint.config.mjs', 'eslint.config.cjs',
      '.eslintrc', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json', '.eslintrc.yml',
    })
  end

  local sources = {
    nonels.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    nonels.builtins.formatting.prettierd,
  }

  -- eslint_d moved out of none-ls core into none-ls-extras.
  local eslint_diag_ok, eslint_diag = pcall(require, 'none-ls.diagnostics.eslint_d')
  if eslint_diag_ok then
    table.insert(sources, eslint_diag.with({ condition = eslint_root }))
  end
  local eslint_fmt_ok, eslint_fmt = pcall(require, 'none-ls.formatting.eslint_d')
  if eslint_fmt_ok then
    table.insert(sources, eslint_fmt.with({ condition = eslint_root }))
  end

  nonels.setup({ sources = sources })
end

-- Keymaps
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename)

-- Commands
vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format() end, {})

-- Diagnostic appearance (0.11+ sign config replaces the deprecated sign_define).
vim.diagnostic.config({
  virtual_text = false,
  float = { source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
})
