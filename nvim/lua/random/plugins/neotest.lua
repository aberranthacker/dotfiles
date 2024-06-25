return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'olimorris/neotest-rspec',
  },
  lazy = true,
  keys = {
    {
      '<leader>tf',
      function()
        require('neotest').run.run(vim.fn.expand('%'))
      end,
      desc = 'Test [f]ile',
    },
  },
  cmd = {
    'Neotest',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-rspec'),
      },
    })
  end,
}
