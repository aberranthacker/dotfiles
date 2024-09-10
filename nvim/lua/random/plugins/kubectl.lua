return {
  enabled = false,
  'ramilito/kubectl.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>k',
      function()
        require('kubectl').open()
      end,
      desc = 'Kubectl',
    },
  },
  config = function()
    require('kubectl').setup()
  end,
}
