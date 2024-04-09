return {
  -- Lightweight yet powerful formatter plugin for Neovim
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        graphql = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
        ruby = { 'rubocop' },
        go = { 'gofumpt', 'goimports-reviser', 'golines' },
      },
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.go', },
      callback = function(args)
        conform.format({ bufnr = args.buf })
      end,
    })

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout = 3000,
      })
    end, { desc = 'Format file or range ([m]ake [p]rettier)' })
  end,
}
