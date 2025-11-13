return {
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ['rust-analyzer'] = {
      -- enable clippy on save
      checkOnSave = {
        command = 'clippy',
      },
    },
  },
}
