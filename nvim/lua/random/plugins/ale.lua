return {
  -- Asynchronous Lint Engine
  'w0rp/ale',
  config = function()
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
  end
}

