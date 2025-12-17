-- add any tools you want to have installed below
return {
  'mason-org/mason.nvim',
  opts = {
    ensure_installed = {
      'stylua',
      'shellcheck',
      'shfmt',
      'flake8',

      -- 'bashls', -- brings an IDE-like experience for bash scripts
      'bash-language-server', -- brings an IDE-like experience for bash scripts
      'clangd', -- understands your C++ code and adds smart features to your editor
      'css-lsp', -- CSS language server
      'gopls', -- official Go language server developed by the Go team
      'html-lsp', -- HTML language server
      'lua-language-server', -- Lua language server
      'rust-analyzer', -- consider using https://github.com/mrcjkb/rustaceanvim
      'rdbg',
      'ruby-lsp',
      'solargraph', -- a language server for Ruby
      'postgres-language-server', -- SQL language server
      'typescript-language-server', -- typescript language server
    },
  },
}
