return {
  -- Lightweight yet powerful formatter plugin for Neovim
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    -- -- Function to check if bin/rubocop exists
    -- local function rubocop_cmd()
    --   local binstub_path = './bin/rubocop'
    --   local mason_path = vim.fn.stdpath('data') .. '/mason/bin/rubocop'
    --
    --   if vim.fn.filereadable(binstub_path) == 1 then
    --     return binstub_path
    --   else
    --     return mason_path
    --   end
    -- end

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        go = { 'gofumpt', 'goimports-reviser', 'golines' },
        graphql = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        make = { 'checkmake' },
        markdown = { 'prettier' },
        -- ruby = {
        --   {
        --     cmd = rubocop_cmd(),
        --     args = { '--auto-correct', '--stdin', '%:p' },
        --     stdin = true,
        --   },
        -- },
        sh = { 'shfmt' },
        sql = { 'sql-formatter' },
        yaml = { 'prettier' },
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

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout = 10000,
      })
    end, { desc = 'Format file or range ((m)ake [p]rettier)' })
  end,
}
