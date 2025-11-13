return {
  cmd = {
    (function()
      -- use `bundle binstub solargraph` to create a bin/solargraph
      local project_solargraph = vim.fn.getcwd() .. '/bin/solargraph'
      local global_solargraph =
        '/home/random/.local/share/nvim/mason/packages/solargraph/bin/solargraph'

      if vim.fn.filereadable(project_solargraph) == 1 then
        return project_solargraph
      else
        return global_solargraph
      end
    end)(),
    'stdio',
  },
  settings = {
    solargraph = {
      diagnostics = false, -- отключить диагностику LSP
    },
  },
}
