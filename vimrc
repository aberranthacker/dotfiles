"------------------------------------------------------------------------------
" “When you look at the dark side, careful you must be.
"  For the dark side looks back.” - Yoda
"------------------------------------------------------------------------------
" vimrc checklist
" https://www.reddit.com/r/vim/wiki/vimrctips
"------------------------------------------------------------------------------
" How to organize your .vimrc and keep track what your vim is capable of.
" https://www.youtube.com/watch?v=Jm0IjtDAWcs
"------------------------------------------------------------------------------
" This must be first, because it changes other options as side effect
set nocompatible " be iMproved
"------------------------------------------------------------------------------
set mouse=
"set ttymouse=
lan C
set encoding=utf-8
set fileformats=unix,dos,mac
set fileencodings=utf-8,cp1251,koi8-r,cp866
set spelllang=en,ru
set   langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯХЪЖЭБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ{}:\"<>
set langmap+=,фисвуапршолдьтщзйкыегмцчняхъжэбю;abcdefghijklmnopqrstuvwxyz[];'\\,.
";',.
" characters to show for non-printable characters
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

" set autowrite " Autowrite when switching to another file
set hidden "
set autoread " Autoread files modified outside of VIM

let mapleader=" " "change the mapleader from \ to Spc
" Plugins config {{{
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
"
"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

" Extended session management for Vim (:mksession on steroids)
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" continuously updated session files
Plug 'tpope/vim-obsession'

" Bbye allows you to do delete buffers (close files) without closing your
" windows or messing up your layout.
Plug 'olegtc/vim-bbye'

" Colorschemes
" Retro groove color scheme for Vim
Plug 'gruvbox-community/gruvbox'
"
Plug 'rafi/awesome-vim-colorschemes'
"
Plug 'xolox/vim-colorscheme-switcher'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" combine with netrw to create a delicious salad dressing
" Plug 'tpope/vim-vinegar'
" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'

" Run your tests at the speed of thought
Plug 'janko-m/vim-test'

" Vim sugar for the UNIX shell commands that need it the most.
Plug 'tpope/vim-eunuch'

" Abbreviation
"
" Substitution
"
" Coercion
"
" Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
" MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru),
" dash-case (cr-), dot.case (cr.), space case (cr<space>),
" and Title Case (crt) are all just 3 keystrokes away.
" https://github.com/tpope/vim-abolish
Plug 'tpope/vim-abolish'

" If you've ever tried using the . command after a plugin map, you were likely
" disappointed to discover it only repeated the last native command inside that
" map, rather than the map as a whole.
" That disappointment ends today.
" Repeat.vim remaps . in a way that plugins can tap into it.
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" Seamless switching between VIM windows and Tmux panes
Plug 'christoomey/vim-tmux-navigator'

" Send command from vim to a running tmux session
Plug 'jgdavey/tslime.vim'

" A Personal Wiki For Vim
Plug 'vimwiki/vimwiki'

" Text outlining and task management for Vim based on Emacs' Org-Mode
Plug 'jceb/vim-orgmode'

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
" https://github.com/dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'

" Jump to any definition and references 👁 IDE madness without overhead 🚀
Plug 'pechorin/any-jump.vim'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" A Vim plugin that manages your tag files bolt80.com/gutentags
Plug 'ludovicchabant/vim-gutentags'

" Arduino IDE intregation for vim.
Plug '4Evergreen4/vim-hardy'

" Syntax highlighting for GNU Octave
Plug 'jvirtanen/vim-octave'

" Vim/Ruby Configuration Files
Plug 'vim-ruby/vim-ruby'

" Ruby on Rails power tools
Plug 'tpope/vim-rails'

" vim plugin for highliting code in ruby here document
Plug 'joker1007/vim-ruby-heredoc-syntax'

" Syntax Highlight for Vue.js components
Plug 'posva/vim-vue'

" CoffeeScript support for vim
Plug 'kchmck/vim-coffee-script'

" Slim syntax highlighting for vim.
Plug 'slim-template/vim-slim'

" Vastly improved Javascript indentation and syntax support in Vim.
Plug 'pangloss/vim-javascript'

" React JSX syntax highlighting and indenting for vim.
Plug 'mxw/vim-jsx'

" List of JavaScript ES6 snippets and syntax highlighting for vim.
Plug 'isRuslan/vim-es6'

" Superior Lisp Interaction Mode for Vim ("SLIME for Vim")
Plug 'kovisoft/slimv'

" Improved nginx vim plugin (incl. syntax highlighting)
Plug 'chr4/nginx.vim'

" Syntax for PDP11-40 assembly
Plug 'olegtc/asmpdp11'

" PDP11 syntax for GNU assembler
Plug 'aberranth/vim-gas-pdp11'

" Syntax for Z80 assembly
Plug 'cpcsdk/vim-z80-democoding'

" The best PostgreSQL plugin for Vim!
Plug 'lifepillar/pgsql.vim'

" Vim configuration files for Elixir
"Plug 'elixir-editors/vim-elixir'

" rails.vim inspired tools for Phoenix
Plug 'c-brenn/phoenix.vim'

" Projectionist provides granular project configuration using "projections".
Plug 'tpope/vim-projectionist'

" A vim plugin that simplifies the transition between multiline and single-line
" code
Plug 'AndrewRadev/splitjoin.vim'
" Change an HTML(ish) opening tag and take the closing one along as well
" Plug 'AndrewRadev/tagalong.vim'
" A simple Vim plugin to switch segments of text with predefined replacements
" Plug 'AndrewRadev/switch.vim'
" A Vim plugin to move function arguments (and other delimited-by-something
" items) left and right
" Plug 'AndrewRadev/sideways.vim'

" Visualize your undo tree
Plug 'mbbill/undotree'

" Dadbod is a Vim plugin for interacting with databases.
" It's a more modern take on dbext.vim, improving on it.
Plug 'tpope/vim-dadbod'

" This vim plugin allows toggling bookmarks per line.
" A quickfix window gives access to all bookmarks.
" Annotations can be added as well. These are special bookmarks with a comment attached.
" They are useful for preparing code reviews.
" All bookmarks will be restored on the next startup.
" https://github.com/MattesGroeger/vim-bookmarks
Plug 'MattesGroeger/vim-bookmarks' 
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_save_per_working_dir = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

" Plug for the Pomodoro time management technique.
Plug 'tricktux/pomodoro.vim'
" Duration of a pomodoro in minutes (default: 25)
let g:pomodoro_time_work = 25
" Duration of a break in minutes (default: 5)
let g:pomodoro_time_slack = 5
" Log completed pomodoros, 0 = False, 1 = True (default: 0)
let g:pomodoro_do_log = 1
" Path to the pomodoro log file (default: /tmp/pomodoro.log)
let g:pomodoro_log_file = "/home/random/pomodoro.log"
let g:pomodoro_notification_cmd = 'zenity --notification --text="Pomodoro finished"'

" Maximizes and restores the current window in Vim.
Plug  'szw/vim-maximizer'

" Many people follow the convention of writing SQL keywords in upper case.
" Few people enjoy using shift or caps lock to do it.
" This plugin fixes that.
Plug 'jsborjesson/vim-uppercase-sql'
" ------------------------------------------------------------------------------
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
" }}}

" detect OS {{{
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif
" }}}
" Terminal specific options {{{
" check http://vimdoc.sourceforge.net/htmldoc/term.html#terminal-options
" for details
if $COLORTERM == 'truecolor'
    " In order for this to work, a couple of environment variables has to be set:
    " TERM=xterm-256color
    " COLORTERM=truecolor
    set termguicolors
else
    let g:gruvbox_termcolors=16
    " set t_Co=256 " assume 256 colors terminal
endif

" disable Background Color Erase(BCE) to properly display background color
" inside tmux and GNU screen
set t_ut=
" }}}
" syntax highlight {{{
" https://vim.fandom.com/wiki/Fix_syntax_highlighting
syntax on
augroup vimrc
  autocmd!
  " autocmd BufWinEnter,Syntax * syn sync  minlines=500 maxlines=500
  autocmd BufWinEnter * syntax sync fromstart
augroup END
" }}}
" Colors (also ExtraWhiteSpace and 81's column highlight) {{{

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
                      "\ | highlight ColorColumn ctermbg=magenta guibg=magenta
augroup END
call matchadd('ColorColumn', '\%81v', 100) " highligh 80's column with text
" set colorcolumn=81 " highligh 80's column with ColorColumn hl-ColorColumn
" https://github.com/morhetz/gruvbox/wiki/Terminal-specific
" let g:seoul256_background = 233
" let g:seoul256_light_background = 256

set background=dark
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1

colorscheme gruvbox

let g:colorscheme_switcher_exclude = [
      \'default',
      \'zellner',
      \'carbonized-light',
      \'delek',
      \'flattened_light',
      \'fogbell_light',
      \'github',
      \'lightning',
      \'lucid',
      \'morning',
      \'OceanicNextLight',
      \'one',
      \'peachpuff',
      \'pyte',
      \'seoul256-light'
      \]
"
"}}}
" UI {{{
set shortmess+=I   "remove useless splash screen
set relativenumber " always show line numbers
set number         " show absolute line number for current line
set textwidth=79   " width of document (used by gd)
set nowrap         " don't wrap lines on load
set linebreak      " wrap only at a character in the breakat option
set formatoptions-=t " don't wrap text when typing
set showmatch      " set show matching parenthesis
" set cpoptions+=$   " display $ at end of change motion
set visualbell     " don't beep
set noerrorbells   " don't beep
set foldmethod=marker
"}}}
" GUI options {{{
if has("gui_running")
    if has("gui_gtk2") || has("gui_gtk3")
        "set guifont=Source\ Code\ Pro\ for\ Powerline\ 13
        set guifont=Source\ Code\ Pro\ for Powerline\ 13
    elseif has("gui_photon")
        set guifont=Source\ Code\ Pro\ for\ Powerline:s16
    elseif has("gui_kde")
        set guifont=Source\ Code\ Pro\ for\ Powerline/16/-1/5/50/0/0/0/1/0
        " font family (in this example, 'Source Code Pro for Powerline')
        " point size (default = 18)
        " pixel size (-1 = default)
        " style hint (what to do if requested family can't be found; 5 = AnyStyle = default)
        " weight (50 = normal, 25 = light, 63 = semibold, 75 = bold, 87 = black)
        " italic (0 = no)
        " underline (0 = no)
        " strikeout (0 = no)
        " fixedPitch (1 = yes)
        " raw (0 = no)
    elseif has("x11")
        " use xfontsel to find name of a font
        set guifont=-*-inconsolata-medium-r-normal-*-*-160-*-*-m-*-*
    else
        set guifont=Consolas:h14
    endif
    set title " change the terminal's title
    set go-=T " remove toolbar
    set go-=m " remove menubar
    set go-=r " remove right-hand scroll bar
    set go-=L " remove left-hand scroll bar
endif
"}}}
" Make the current window big, but leave others context {{{
"
set winwidth=106
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
" set winheight=5
" set winminheight=5
" set winheight=60 "999
" }}}
" Spaces, TABs and Indentation {{{
" Real programmers don't use TABs but spaces
" https://www.reddit.com/r/vim/wiki/tabstop
set tabstop=8     " a tab is eight spaces
set softtabstop=2 " This is useful to keep the 'ts' setting at its standard
                  " value of 8, while being able to edit like it is set to 'sts'.
set shiftwidth=2  " number of spaces to use for autoindenting
set expandtab     " insert spaces instead of tabs
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  " shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
"}}}
" Search {{{
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
"}}}
" Custom autocmds {{{
":help autocmd-events
augroup vimrcEx
    " Clear all autocmds in the group
    autocmd!
    autocmd FileType text setlocal textwidth=78

    "for ruby, autoindent with two spaces, always expand tabs
    autocmd FileType ruby,haml,eruby,yaml,html,sass,cucumber set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType javascript,vue set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType json,xml,c set autoindent shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType json,xml setlocal foldmethod=syntax

    " Setting global variables for Ruby
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType ruby compiler ruby
    autocmd FileType html,eruby let g:html_indent_tags = '\|p\|li\|dt\|dd'

    autocmd BufRead *.axlsx set filetype=ruby
    autocmd BufRead *.arb set filetype=ruby

    " add yaml stuffs
    " au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    " autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    autocmd FileType python set shiftwidth=4 softtabstop=4 expandtab

    autocmd! BufRead,BufNewFile *.sass setfiletype sass

    autocmd BufRead *.s set fileformat=unix filetype=gas tabstop=8 expandtab shiftwidth=4 autoindent
    autocmd BufRead *.md set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead,BufNewFile *.md setlocal spell

    " saves and restores manual folds and other stuff of a view
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview

    " Don't syntax highlight markdown because it's often wrong
    autocmd! FileType mkd setlocal syn=off

    " Leave the return key alone when in command line windows, since it's used
    " to run commands there.
    autocmd! CmdwinEnter * :unmap <cr>
    autocmd! CmdwinLeave * :call MapCR()

    " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "normal g`\"" |
                \ endif

    " Automatic reloading of .vimrc after changes
    autocmd! BufWritePost .vimrc source $MYVIMRC
    autocmd! BufWritePost _vimrc source $MYVIMRC
    autocmd! BufWritePost vimrc  source $MYVIMRC
augroup END " }}}
" Keymaps {{{
"
" Resize windows using arrow keys
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" Show next matched string at the center of screen
nnoremap n nzz
nnoremap N Nzz

nnoremap gf gF
nnoremap gF gf

map <leader>w :%s/\v\s+$//g<CR>
" " we want very magic regexp by default, but we don't want to break plugings by
" " 'set nomagic'
" nnoremap / /\v
" " cnoremap %s/ %s/\v
" cnoremap %s %s/\v

if g:os == "Darwin"
  map <leader>c :w !pbcopy<CR><CR>
  vmap <leader>c :w !pbcopy<CR><CR>
elseif g:os == "Linux"
  map <leader>c :w !xclip<CR><CR>
  vmap <leader>c :w !xclip<CR><CR>
elseif g:os == "Windows"
  echo "Doesn't work on windows"
end

" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" make F1 to act as Esc
noremap <F1> <Esc>
vnoremap <F1> <Esc>
inoremap <F1> <Esc>

nnoremap <F5> :UndotreeToggle<CR>

" F8 toggles showing non-printable characters
noremap <F9> :set list!<CR>
inoremap <F9> <Esc>:set list!<CR>a

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
" Quicksave commnd
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
" Quick quit command, delete current buffer without window closing
noremap <Leader>q :Bdelete<CR>
" Quit all windows
noremap <Leader>Q :qa!<CR>
" bind Ctrl+<movement> keys to move aroud the windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
"nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"open .vimrc using \v
map \v :next $MYVIMRC<CR>

" match behaviour of C and D
noremap Y y$
"}}}
" Disable backup and swap files {{{
set nobackup
set nowritebackup
set noswapfile
" }}}

" autocompletion {{{
" use Tab key for autocompletion
function! InsertTabWrapper()
    let col = col(".") - 1
    if !col || getline(".")[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>

" set omnifunc=syntaxcomplete#Complete
" set omnifunc=ale#completion#OmniFunc

" Display all mathching files when we tab complete
set wildmenu
" }}}

" A.L.E {{{
let g:ale_fixers = {
            \'ruby': ['rubocop'],
            \'javascript': ['eslint'],
            \}
let g:ale_linters = {
            \'elixir': ['credo'],
            \}
let g:ale_lint_on_text_changed = 'never'
" don't run linters on opening a file
let g:ale_lint_on_enter = 0
" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 0
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" " Map movement through errors without wrapping.
" nmap <silent> <leader>k <Plug>(ale_previous)
" nmap <silent> <leader>j <Plug>(ale_next)
" }}}
nmap <leader>p :%DB postgresql://redmine@localhost/redmine_vd<CR>
" Maps to jump to specific CtrlP targets and files {{{
" look in Silver Searcher section for more oprions
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_user_command = "fd --color never --type f --glob --full-path '**/%s/*"

set wildignore+=*/.git/*,*/tmp/*,*/log/*,*.so,*.swp,*.zip,*.un~ " MacOSX/Linux

function! ShowRoutes()
    " Requires 'scratch' plugin
    :topleft 100 :split __Routes__
    " Make sure Vim doesn't write __Routes__ as a file
    :set buftype=nofile
    " Delete everything
    :normal 1GdG
    " Put routes output in buffer
    :0r! bundle exec rake -s routes
    " Size window to number of lines (1 plus rake output length)
    :exec ":normal " . line("$") . "_ "
    " Move cursor to bottom
    :normal 1GG
    " Delete empty trailing line
    :normal dd
endfunction

map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gR :call ShowRoutes()<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

map <leader>ga :CtrlP app/assets<cr>
map <leader>gj :CtrlP app/javascript<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gl :CtrlP config/locales<cr>
map <leader>gi :CtrlP config<cr>
map <leader>gp :CtrlP public<cr>
map <leader>gs :CtrlP public/stylesheets<cr>
map <leader>gf :CtrlP features<cr>
map <leader>gt :CtrlP spec<cr>
map <leader>f  :CtrlPClearCache<cr>\|:CtrlP<cr>
" CtrlP on VIM Buffers
map <leader>b  :CtrlPBuffer<cr>
" CtrlP on Most Recently Used files
map <leader>r  :CtrlPMRU<cr>
map <leader>F  :CtrlP %%<cr>
"}}}
" CtrlSF {{{
map <Leader>sf <Plug>CtrlSFPrompt
map <Leader>sw <Plug>CtrlSFVwordPath
" }}}
" NerdTree {{{
noremap <BS> :NERDTreeToggle<cr>
let g:NERDTreeAutoDeleteBuffer=1
" added as temporary workaround until issue
" https://github.com/preservim/nerdtree/issues/1321
" will be fixed
let g:NERDTreeMinimalMenu=1
" let g:NERDTreeIgnore=[
"   \'advanced_html_to_xlsx_export',
"   \'advanced_issues',
"   \'advanced_personal_page',
"   \'backlight_delay',
"   \'base_4_additions',
"   \'clipboard_image_paste',
"   \'computed_custom_field',
"   \'covid_opros_additions',
"   \'custom_field_groups',
"   \'custom_projects_reports',
"   \'custom_tables',
"   \'dynamically_added_custom_fields',
"   \'dynamically_required_custom_fields',
"   \'easy_baseline',
"   \'easy_gantt',
"   \'easy_gantt_pro',
"   \'easy_mindmup',
"   \'easy_wbs',
"   \'extra_queries',
"   \'extra_queries_extend',
"   \'global_roles',
"   \'gu_additions',
"   \'hot_additions',
"   \'import_privivki_issues',
"   \'info_message',
"   \'issue_project_user_query_columns',
"   \'issues_importer',
"   \'issues_reports',
"   \'logo_plugin',
"   \'magic_numbers_constantize',
"   \'metrika',
"   \'new_scoring_layout',
"   \'nxs_chat',
"   \'plugin_mep_api',
"   \'plugin_support',
"   \'projects_importer',
"   \'redmine_agile',
"   \'redmine_dashboards_charts',
"   \'redmine_editauthor',
"   \'redmine_extended_csv',
"   \'redmine_load_xlsx',
"   \'redmine_mail_reminder',
"   \'redmine_paper_trail',
"   \'redmine_people',
"   \'redmine_percent_done',
"   \'redmine_pivot_table',
"   \'redmine_pretend',
"   \'project_columns',
"   \'project_emails',
"   \'projects_reports',
"   \'projects_table',
"   \'redmine_checklists',
"   \'redmine_ckeditor',
"   \'redmine_sidekiq',
"   \'redmine_xlsx_format_issue_exporter',
"   \'redmineup_tags',
"   \'row_estimator',
"   \'select2_make',
"   \'set_custom_field_default',
"   \'smi_additions',
"   \'soft_reports',
"   \'subtask_list_columns',
"   \'telegram_bot',
"   \'upages_projects',
"   \'usability',
"   \'user_journal',
"   \'vd_additions',
"   \'vd_epic_dashboard',
"   \'vd_extended_projects',
"   \'vd_external_data',
"   \'vd_hidden_users',
"   \'vd_hierarchy_issues',
"   \'vd_hr_reports',
"   \'vd_import_file',
"   \'vd_issue_subissue_count_query_columns',
"   \'vd_linked_list',
"   \'vd_links_multiple',
"   \'vd_lists_menu',
"   \'vd_mc_additions',
"   \'vd_meta_info',
"   \'vd_mg_additions',
"   \'vd_mz_additions',
"   \'vd_offer',
"   \'vd_people_analytics',
"   \'vd_project_list_attribute',
"   \'vd_redmine_api',
"   \'vd_rgis_integration',
"   \'vd_status_extended',
"   \'vd_time_entries_attachments',
"   \'vd_time_tracking',
"   \'vd_user_additional_rights',
"   \'vd_vacation_time',
"   \'vd_views_projects',
"   \]
" }}}
" pgsql {{{
let g:sql_type_default = 'pgsql'
" }}}
" Rails projections {{{
"
let g:rails_projections = {
            \  "spec/factories/*.rb": {
            \    "command": "factory",
            \    "affinity": "collection",
            \    "alternate": "app/models/%i.rb",
            \    "related": "db/schema.rb#%s",
            \    "test": "test/models/%i_test.rb",
            \    "template": "FactoryGirl.define do\n  factory :%i do\n  end\nend",
            \    "keywords": "factory sequence"
            \  }
            \}
"}}}
" slimv {{{
let g:slimv_impl='sbcl'
let g:slimv_swank_cmd='!tmux new-window -d -n REPL-SBCL "sbcl --load  ~/.vim/bundle/slimv/slime/start-swank.lisp"'
let g:lisp_rainbow=1
" }}}
" Use The Silver Searcher or ripgrep, which depends... {{{
if executable('rg')
    " Use ripgrep in CtrlP for listing files. Lock-free parallel recursive
    " directory search and respects .gitignore
    let g:ctrlp_user_command = 'rg -F -l --color never --hidden -g !.git -g "" %s --files'
    " ripgrep is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
elseif executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden --ignore .git -g "" %s'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in ack
    let g:ackprg = 'ag --vimgrep'
elseif executable('rg')
    " Use ripgrep over Grep
    set grepprg=rg\ --no-heading\ --color\ never
    " Use ripgrep in ack
    let g:ackprg = 'rg --vimgrep'
endif
" }}}
"
" tslime {{{
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
" }}}
" vim-airline {{{
" let g:airline_theme='gruvbox'
" let g:airline_theme='synthwave'
" let g:airline_theme='seoul256'
let g:airline_section_b = ''

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" }}}
" GNU Assembler {{{
" 186 286 3862 386 486 8086 amd arm avr future ia64 katmai nehalem p6 pentium_m pentium prescott sandybridge x642 x64
" let g:gasDisableOpcodes='x64'
" }}}
" vim-rails {{{
nnoremap <C-@> :A<CR>
" }}}
" vim-ruby {{{
let ruby_operators = 1
let ruby_space_errors = 1
let ruby_spellcheck_strings = 1
"}}}
" vim-ruby-heredoc-syntax {{{
let g:ruby_heredoc_syntax_filetypes = {
        \ "sql" : {
        \   "start" : "SQL",
        \},
        \ "pgsql" : {
        \   "start" : "PGSQL",
        \},
        \ "javascript" : {
        \   "start" : "JS",
        \},
        \ "json" : {
        \   "start" : "JSON",
        \}
  \}
" }}}
" {{{ vim-session
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic=1
let g:session_directory="./"
" }}}
" vim-test {{{
map <Leader>t :TestFile<CR>
map <Leader>s :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>a :TestSuite<CR>
"nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
"}}}
" vim-vue {{{
let g:vue_disable_pre_processors=0
autocmd FileType vue syntax sync fromstart
" }}}
"{{{ VimWiki
autocmd FileType vimwiki setlocal nowrap spell
let wiki = {}
let wiki.path =  '~/Dropbox/vimwiki'
let wiki.nested_syntaxes = {
            \'ruby': 'ruby',
            \'sql' : 'sql',
            \'python': 'python',
            \'c++': 'cpp',
            \'json': 'json',
            \'js': 'javascript',
            \'yaml': 'yaml',
            \'sh': 'sh'
            \}
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
let g:vimwiki_dir_link = 'index'
" ''       Disable folding.
" 'expr'   Folding based on expression (folds sections and code blocks).
" 'syntax' Folding based on syntax (folds sections; slower than 'expr').
" 'list'   Folding based on expression (folds list subitems; much slower).
let g:vimwiki_folding = 'list'
"}}}

set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Better copy & paste
set pastetoggle=<F2>  " toggle pasting unmodified text from system clipboard
set clipboard=unnamed " use system clipboard

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" commented out because started to use vim-gutentags instead of guard-ctags
" " add tags files generated by guard-ctags-bundler
" set tags+=tags;/
" set tags+=gems.tags;/

" Auto closing HTML tag
:iabbrev <// </<C-X><C-O>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" instruct the sh plugin to fall to Bash by default, rather than Bourne shell
let g:is_bash=1

" prettify JSON
" :%!python -m json.tool
" replace escaped codeponints with unicode chars
" :%s#\\u[0-9a-f]*#\=eval('"'.submatch(0).'"')#g
" or
" :%s#\v\\u([0-9a-f]{4})#\=nr2char(str2nr(submatch(1),16))#g
