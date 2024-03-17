return {
  -- Lightweight yet powerful formatter plugin for Neovim
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        ruby = { 'rubocop' },
      },
      --format_on_save = {
      --  lsp_fallback = true,
      --  async = false,
      --  timeout = 3000,
      --},
    })

    -- vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
    --   conform.format({
    --     lsp_fallback = true,
    --     async = false,
    --     timeout = 3000,
    --   })
    -- end, { desc = 'Format file or range ([m]ake [p]rettier)' })
  end
}
