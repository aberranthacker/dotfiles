function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { remap = false, silent = false })
end

function noremap(shortcut, command) -- map
  map({'n', 'v', 's', 'o'}, shortcut, command)
end

function nnoremap(shortcut, command) -- nmap
  map('n', shortcut, command)
end

function inoremap(shortcut, command) -- imap
  map('i', shortcut, command)
end

function vnoremap(shortcut, command) -- vmap
  map('v', shortcut, command)
end

function cnoremap(shortcut, command) -- cmap
  map('c', shortcut, command)
end

function tnoremap(shortcut, command) -- tmap
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
noremap('<C-Z>', ':update<CR>')
vnoremap('<C-Z>', '<C-C>:update<CR>')
inoremap('<C-Z>', '<C-O>:update<CR>')
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
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Open files in directory of current file
--vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>", { remap = false, silent = false })
cnoremap('%%', "<C-R>=expand('%:h').'/'<cr>")
noremap('<leader>e', ':edit %%')
noremap('<leader>v', ':view %%')

-- PLUGINS

-- Quick quit command, delete current buffer without window closing
noremap('<Leader>q', ':Bdelete<CR>')
-- nvim-tree
--noremap('<BS>', ':NvimTreeToggle<cr>')
noremap('<BS>', ':NvimTreeFindFile<cr>')
