return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      svelte = { 'eslint_d' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    local function conditional_lint()
      local filetype = vim.bo.filetype
      if filetype == 'ruby' then
        vim.lsp.buf.formatting_sync() -- или другая функция форматирования/линтинга для Solargraph
      else
        lint.try_lint()
      end
    end

    -- Настройка сочетания клавиш
    vim.keymap.set(
      'n',
      '<leader>ll',
      conditional_lint,
      { desc = 'Trigger [l]inting for current file' }
    )

    -- vim.keymap.set('n', '<leader>ll', function()
    --   lint.try_lint()
    -- end, { desc = 'Trigger [l]inting for current file' })
  end,
}
