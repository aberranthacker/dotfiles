return {
  -- A Personal Wiki For Vim
  'vimwiki/vimwiki',
  enabled = false,
  config = function()
    vim.cmd([[
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
    ]])
  end,
}
