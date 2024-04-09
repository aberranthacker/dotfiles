return {
  -- Portable package manager for Neovim that runs everywhere Neovim runs.
  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig') -- import mason_lspconfig

    local mason_tool_installer = require('mason-tool-installer')

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        'cssls',
        'html',
        'gopls', -- official Go language server developed by the Go team
        'lua_ls',
        'sqlls',
        'tsserver',
      },
      automatic_installation = false,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        'prettier', -- an opinionated code formatter
        'stylua', -- an opinionated Lua code formatter
        'rubocop',
        'gofumpt', -- a stricter formatter than gofmt
        'goimports-reviser', -- sorts goimports by 3-4 groups
        'golines', -- a golang formatter that fixes long lines
        'delve', -- a debugger for the Go programming language
      },
    })
  end,
}
