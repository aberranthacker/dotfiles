-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- stylua: ignore start
vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯХЪЖЭБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ{}:"<>,' ..
                  "фисвуапршолдьтщзйкыегмцчняхъжэбю;abcdefghijklmnopqrstuvwxyz[];'\\,."
-- stylua: ignore end

-- remove extra gutter columns
vim.opt.signcolumn = 'no' -- or "auto" to only show when needed (may cause text to shift)
vim.opt.foldcolumn = '0'

-- make the number column as narrow as possible
vim.opt.numberwidth = 1

vim.opt.spelllang = 'en,ru'

-- characters to show for non-printable characters
vim.opt.list = false
vim.opt.listchars = 'eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+'
vim.opt.fillchars:append('vert: ')
