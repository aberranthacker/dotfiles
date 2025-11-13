return {
  -- https://github.com/Exafunction/codeium.vim
  'Exafunction/codeium.vim',
  event = 'BufEnter',

  config = function()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-l>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-h>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })
    vim.keymap.set('n', '<leader>cc', function()
      return vim.fn['codeium#Chat']()
    end, { expr = true, silent = true })
  end,
}
-- return {
--   'Exafunction/codeium.nvim',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--     'hrsh7th/nvim-cmp',
--   },
--   config = function()
--     require('codeium').setup({
--       enable_chat = true,
--     })
--   end,
-- }
