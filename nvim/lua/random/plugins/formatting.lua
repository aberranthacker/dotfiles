return {
  -- Lightweight yet powerful formatter plugin for Neovim
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    -- Function to check if bin/rubocop exists
    local function rubocop_cmd()
      local binstub_path = './bin/rubocop'
      local mason_path = vim.fn.stdpath('data') .. '/mason/bin/rubocop'

      if vim.fn.filereadable(binstub_path) == 1 then
        return binstub_path
      else
        return mason_path
      end
    end

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        -- Conform will run multiple formatters sequentially
        -- Use a sub-list to run only the first available formatter
        go = { 'gofumpt', 'goimports-reviser', 'golines' },
        graphql = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        make = { 'checkmake' },
        markdown = { 'prettier' },
        -- ruby = { 'rubocop' },
        sh = { 'shfmt' },
        sql = { 'sql-formatter' },
        yaml = { 'prettier' },
      },
      formatters = {
        rubocop = {
          command = rubocop_cmd(),
          args = { '--auto-correct', '--stderr', '--stdin', '%:p' },
          stdin = true,
          --cwd = require('conform.util').root_file({ '.rubocop.yml' }),
        },
      },
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.go', '*.lua' },
      callback = function(args)
        conform.format({
          bufnr = args.buf,
          lsp_fallback = true,
        })
      end,
    })

    vim.keymap.set({ 'n' }, '<leader>pf', function()
      conform.format({
        lsp_format = 'fallback',
        async = false,
        timeout_ms = 10000,
      })
    end, { desc = '(p)rettify [f]ile' })

    vim.keymap.set({ 'n' }, '<leader>pl', function()
      conform.format({
        range = { vim.fn.line('.'), vim.fn.line('.') },
        lsp_fallback = true,
        async = false,
      })
    end, { desc = '(p)ettify [l]ine' })

    vim.keymap.set({ 'v' }, '<leader>pb', function()
      conform.format({
        range = nil,
        lsp_fallback = true,
        async = false,
      })
    end, { desc = '(p)rettify [b]lock' })
  end,
}
