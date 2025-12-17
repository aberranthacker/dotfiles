return {
  {
    'neovim/nvim-lspconfig',
    init = function()
      -- note to self: kill LSP’s “references under cursor” highlights everywhere
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('no_document_highlight', { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            client.server_capabilities.documentHighlightProvider = false -- no more symbol highlights
          end
        end,
      })
    end,
  },
}
