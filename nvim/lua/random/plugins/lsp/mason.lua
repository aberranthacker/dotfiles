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
        'bashls', -- brings an IDE-like experience for bash scripts
        'clangd', -- understands your C++ code and adds smart features to your editor
        'cssls', -- CSS language server
        'gopls', -- official Go language server developed by the Go team
        'html', -- HTML language server
        'lua_ls', -- Lua language server
        'rust_analyzer', -- consider using https://github.com/mrcjkb/rustaceanvim
        'solargraph', -- a language server for Ruby
        'sqlls', -- SQL language server
        'tsserver', -- typescript language server
      },
      automatic_installation = false,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        'delve', -- a debugger for the Go programming language
        'eslint_d', -- makes eslint the fastest linter on the planet.
        'gofumpt', -- a stricter formatter than gofmt
        'goimports-reviser', -- sorts goimports by 3-4 groups
        'golines', -- a golang formatter that fixes long lines
        'prettier', -- an opinionated code formatter
        'rubocop', -- a Ruby static code analyzer (a.k.a. linter) and code formatter
        'shellcheck', -- a linter for shell scripts
        'shfmt', -- a shell formatter
        'stylua', -- an opinionated Lua code formatter
      },
    })
  end,
}
