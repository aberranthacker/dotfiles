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
  map({'n', 'v', 's', 'o'}, shortcut, command)
end

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

-- Bind nohl
-- Removes highlight of your last search
noremap('<C-n>', ':nohl<cr>:call clearmatches()<cr>')
-- match behaviour of C and D
noremap('Y', 'y$')

-- Quit all windows
vim.cmd('noremap <Leader>Q :qa!<CR>')

-- Quicksave commnd
keymap.set({'n', 'v', 's', 'o'}, '<C-Z>', ':update<CR>', { remap = false })
keymap.set('i', '<C-Z>', '<C-O>:update<CR>', { remap = false })

-- bind Ctrl+<movement> keys to move aroud the windows
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')
nnoremap('<C-h>', '<C-w>h')
-- Resize windows using arrow keys
nnoremap('<Up>',    ':resize +2<CR>')
nnoremap('<Down>',  ':resize -2<CR>')
nnoremap('<Left>',  ':vertical resize +2<CR>')
nnoremap('<Right>', ':vertical resize -2<CR>')
-- Show next matched string at the center of screen
nnoremap('n', 'nzz')
nnoremap('N', 'Nzz')

nnoremap('gf', 'gF')
nnoremap('gF', 'gf')

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Open files in directory of current file
--vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>", { remap = false, silent = false })
cnoremap('%%', "<C-R>=expand('%:h').'/'<cr>")
noremap('<leader>e', ':edit %%')
noremap('<leader>v', ':view %%')

-- easier moving between tabs
noremap('<Leader>n', '<esc>:tabprevious<CR>')
noremap('<Leader>m', '<esc>:tabnext<CR>')

-- make F1 to act as Esc
vim.keymap.set({'n', 'v', 's', 'o', 'i'}, '<F1>', '<Esc>', { remap = false })

-- F9 toggles showing non-printable characters
noremap('<F9>', ':set list!<CR>')
inoremap('<F9>', '<Esc>:set list!<CR>a')

-- PLUGINS

-- Quick quit command, delete current buffer without window closing
noremap('<Leader>q', ':Bdelete<CR>')

noremap('<leader>p', ':%DB postgresql://redmine@localhost/redmine_mii<CR>')
