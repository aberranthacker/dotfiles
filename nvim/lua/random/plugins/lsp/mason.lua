return {
  -- Portable package manager for Neovim that runs everywhere Neovim runs.
  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig') -- import mason_lspconfig

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        'cssls',
        'html',
        'lua_ls',
        'sqlls',
        'tsserver',
      },
      automatic_installation = false,
    })
  end
}
