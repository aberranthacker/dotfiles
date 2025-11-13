return {
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      -- list of servers for mason to install
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
        'ts_ls', -- typescript language server
      },
      automatic_installation = false,
    },
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {
          ui = {
            icons = {
              package_installed = '✓',
              package_pending = '➜',
              package_uninstalled = '✗',
            },
          },
        },
      },
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
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
    },
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
}
