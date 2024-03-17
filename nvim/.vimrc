lan C

set hidden "
set autoread " Autoread files modified outside of VIM

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Run your tests at the speed of thought
Plug 'janko-m/vim-test'

" Send command from vim to a running tmux session
Plug 'jgdavey/tslime.vim'

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
" https://github.com/dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'

" Superior Lisp Interaction Mode for Vim ("SLIME for Vim")
Plug 'kovisoft/slimv'

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

" Many people follow the convention of writing SQL keywords in upper case.
" Few people enjoy using shift or caps lock to do it.
" This plugin fixes that.
Plug 'jsborjesson/vim-uppercase-sql'
" ------------------------------------------------------------------------------
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif
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
" }}}

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

    autocmd FileType python set shiftwidth=4 softtabstop=4 expandtab

    autocmd! BufRead,BufNewFile *.sass setfiletype sass

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

    " Automatic reloading of .vimrc after changes
    autocmd! BufWritePost .vimrc source $MYVIMRC
    autocmd! BufWritePost _vimrc source $MYVIMRC
    autocmd! BufWritePost vimrc  source $MYVIMRC
augroup END " }}}

" Keymaps {{{
"
" Show next matched string at the center of screen
nnoremap n nzz
nnoremap N Nzz

nnoremap gf gF
nnoremap gF gf

map <leader>w :%s/\v\s+$//g<CR>

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

nnoremap <F5> :UndotreeToggle<CR>

" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
"nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"open .vimrc using \v
map \v :next $MYVIMRC<CR>
"}}}

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

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Auto closing HTML tag
:iabbrev <// </<C-X><C-O>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" instruct the sh plugin to fall to Bash by default, rather than Bourne shell
let g:is_bash=1
