---- Custom autocmds
-- :help autocmd-events
local augroup = vim.api.nvim_create_augroup('vimrcEx', {clear = true})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.s',
  group = augroup,
  command = 'set fileformat=unix filetype=gas tabstop=8 expandtab shiftwidth=4 autoindent'
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = "Jump to last cursor position unless it's invalid or in an event handler",
  pattern = '*',
  group = augroup,
  command = [[
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal g`\""
    endif
  ]]
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
