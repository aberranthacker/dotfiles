-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- n Normal
-- i Insert
-- c Command-line
-- v Visual
-- s Select
-- o Operator-pending
-- t Terminal
-- l Lang-Arg
-- :h map-table
local keymap = vim.keymap

local function map(mode, shortcut, command)
  keymap.set(mode, shortcut, command, { remap = false, silent = false })
end

local function noremap(shortcut, command) -- map
  map({ 'n', 'v', 's', 'o' }, shortcut, command)
end

noremap('<C-n>', ':nohl<cr>:call clearmatches()<cr>')

local function nnoremap(shortcut, command) -- nmap
  map('n', shortcut, command)
end

local function inoremap(shortcut, command) -- imap
  map('i', shortcut, command)
end

local function vnoremap(shortcut, command) -- vmap
  map('v', shortcut, command)
end

local function cnoremap(shortcut, command) -- cmap
  map('c', shortcut, command)
end

local function tnoremap(shortcut, command) -- tmap
  map('t', shortcut, command)
end

vim.keymap.set('n', '<BS>', Snacks.explorer.open, {
  desc = 'nvim-tree: Toggle',
  noremap = true,
  silent = true,
  nowait = true,
})

-- Removes highlight of your last search
noremap('<C-n>', function()
  -- точный эквивалент :nohl (сброс подсветки последнего поиска, опцию не трогаем)
  vim.cmd.nohlsearch()
  -- эквивалент :call clearmatches()
  vim.fn.clearmatches()
end)

-- F9 toggles showing non-printable characters
noremap('<F9>', function()
  vim.wo.list = not vim.wo.list
end)
inoremap('<F9>', function()
  vim.wo.list = not vim.wo.list
end)

-- Remove LazyVim’s default mappings for Shift-h / Shift-l (so they do nothing)
vim.keymap.del('n', '<S-h>')
vim.keymap.del('n', '<S-l>')

-- Remap previous/next buffer to the arrow keys:
vim.keymap.set('n', '<Left>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<Right>', '<cmd>bnext<cr>', { desc = 'Next buffer' })

local pick = LazyVim.pick

-- <leader><space> and <leader>ff -> Find Files (cwd)
vim.keymap.set('n', '<leader><space>', function()
  pick('files', { root = false })()
end, { desc = 'Find Files (cwd)' })

vim.keymap.set('n', '<leader>ff', function()
  pick('files', { root = false })()
end, { desc = 'Find Files (cwd)' })

-- <leader>fF -> Find Files (Root Dir)
vim.keymap.set('n', '<leader>fF', function()
  pick('files', { root = true })()
end, { desc = 'Find Files (Root Dir)' })
