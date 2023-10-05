-- vim.opt instead of set, vim.g instead of let

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true -- use 24-bit colors
vim.opt.background = 'dark'
-- https://github.com/morhetz/gruvbox/wiki/Terminal-specific
vim.cmd('colorscheme gruvbox')
vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_contrast_light = 'hard'
vim.g.gruvbox_italic = 1

-- Basic settings --------------------------------------------------------------
vim.opt.encoding = 'utf-8'
vim.opt.fileformats = 'unix,dos,mac'
vim.opt.fileencodings = 'utf-8,cp1251,koi8-r,cp866'
vim.opt.spelllang = 'en,ru'
vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯХЪЖЭБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ{}:"<>,' ..
                  "фисвуапршолдьтщзйкыегмцчняхъжэбю;abcdefghijklmnopqrstuvwxyz[];'\\,."
vim.opt.backspace = 'indent,eol,start' -- backspace works on every char in insert mode
vim.opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.history = 1000
vim.opt.undolevels = 1000 -- use many muchos levels of undo
--vim.opt.dictionary = '/usr/share/dict/words'
vim.opt.startofline = true
-- characters to show for non-printable characters
vim.opt.listchars='eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+'
--------------------------------------------------------------------------------
-- Search ----------------------------------------------------------------------
vim.opt.ignorecase = true -- ignore case when searching UNLESS \C or capital in search
vim.opt.smartcase  = true -- ignore case if search pattern is all lowercase,
                          -- case-sensitive otherwise
vim.opt.hlsearch   = true -- highlight search terms
vim.opt.incsearch  = true -- show search matches as you type
--------------------------------------------------------------------------------
-- Display ---------------------------------------------------------------------
vim.opt.showmatch = true -- show matching brackets
vim.opt.synmaxcol = 300  -- stop syntax highlight after x lines for performance

vim.opt.foldmethod = 'marker' -- use language syntax to generate folds
vim.opt.foldlevel = 4  -- limit folding to 4 levels
vim.opt.wrap = false   -- do not wrap lines even if very long
vim.opt.showbreak= '↪' -- character to show when line is broken
--vim.opt.cpoptions+='$' -- display $ at end of change motion
--------------------------------------------------------------------------------
-- UI --------------------------------------------------------------------------
vim.opt.mouse = nil           -- disable  mouse support
vim.opt.relativenumber = true -- always show line numbers
vim.opt.number = true         -- show absolute line number for current line
--vim.opt.textwidth = 79        -- width of document (used by gd)
vim.opt.wrap = false          -- don't wrap lines on load
vim.opt.linebreak = true      -- wrap only at a character in the breakat option

-- Make the current window big, but leave others context
vim.opt.winwidth = 106
---- We have to have a winheight bigger than we want to set winminheight.
---- But if we set winheight to be huge before winminheight,
---- the winminheight set will fail.
-- vim.opt.winheight=5
-- vim.opt.winminheight=5
-- vim.opt.winheight=60 --999

-- Spaces, TABs and Indentation
-- Real programmers don't use TABs but spaces
vim.opt.tabstop = 8       -- a tab is eight spaces
vim.opt.softtabstop = 2   -- This is useful to keep the 'ts' setting at its standard
                          -- value of 8, while being able to edit like it is set to 'sts'.
vim.opt.shiftwidth = 2    -- number of spaces to use for autoindenting
vim.opt.expandtab  = true -- insert spaces instead of tabs
vim.opt.shiftround = true -- use multiple of shiftwidth when indenting with '<' and '>'
vim.opt.smarttab   = true -- insert tabs on the start of a line according to
                          -- shiftwidth, not tabstop
vim.opt.autoindent = true -- always set autoindenting on
vim.opt.copyindent = true -- copy the previous indentation on autoindenting

-- Commands mode
vim.opt.wildmenu = true -- on TAB, complete options for system command
vim.opt.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,'..
                     '*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,'..
                     '*.out,*.toc'

-- Better copy & paste
vim.opt.pastetoggle = '<F2>'  -- toggle pasting unmodified text from system clipboard
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
--------------------------------------------------------------------------------
-- Custom autocmds
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


vim.g.ale_fixers = {
  ruby = {'rubocop'},
  javascript = {'eslint'},
}
-- let g:ale_linters = {
--             \'elixir': ['credo'],
--             \}
-- let g:ale_lint_on_text_changed = 'never'
-- " don't run linters on opening a file
-- let g:ale_lint_on_enter = 0
-- " Enable completion where available.
-- " This setting must be set before ALE is loaded.
-- let g:ale_completion_enabled = 0
-- " Set this. Airline will handle the rest.
-- let g:airline#extensions#ale#enabled = 1

-- vim-ruby-heredoc-syntax
vim.g.ruby_heredoc_syntax_filetypes = {
  sql = { start = "SQL", },
  pgsql = { start = "PGSQL", },
  javascript = { start = "JS", },
  json = { start = "JSON", }
}
