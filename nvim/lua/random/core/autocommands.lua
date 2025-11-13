---- Custom autocmds
-- :help autocmd-events
local augroup = vim.api.nvim_create_augroup('vimrcEx', { clear = true })

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*.s',
  group = augroup,
  callback = function()
    vim.opt_local.fileformat = 'unix'
    vim.opt_local.filetype = 'vm2'
    vim.opt_local.tabstop = 8
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.autoindent = true
    vim.opt_local.commentstring = ';%s'
    vim.opt.cursorline = true
  end,
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'c,cpp',
  group = augroup,
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt.cursorline = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.opt_local.expandtab = false -- Use actual tab characters
    vim.opt_local.tabstop = 4 -- Tab character width
    vim.opt_local.shiftwidth = 4 -- Indentation level width
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = "Jump to last cursor position unless it's invalid or in an event handler",
  pattern = '*',
  group = augroup,
  command = [[
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal g`\""
    endif
  ]],
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
