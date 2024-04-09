return {
  {
    'leoluz/nvim-dap-go',
    dependencies = {
      --  Debug Adapter Protocol client implementation for Neovim
      'mfussenegger/nvim-dap',
    },
    config = function(_, opts)
      require('dap-go').setup(opts)

      vim.keymap.set({ 'n' }, '<leader>db', function ()
        vim.cmd('DapToggleBreakpoint')
      end, { desc = '[D]AP: add [b]reakpoint' })

      vim.keymap.set({ 'n' }, '<leader>dus', function ()
        local widgets = require('dap.ui.widgets')
        local sidebar = widgets.sidebar(widgets.scope)
        sidebar.open()
      end, { desc = '[D]AP: Open [U]I debugging [s]idebar' })
    end
  },
}
