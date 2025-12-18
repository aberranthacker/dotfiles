return {
  {
    'folke/snacks.nvim',
    opts = {
      dashboard = { enabled = false },
      scratch = { enabled = true }, -- scratch buffers with a persistent file
      terminal = { enabled = false }, -- create and toggle terminal windows
      scroll = { enabled = false }, -- fuck smooth scrolling
      indent = { enabled = false }, -- visualize indent guides and scopes based on treesitter or indent
      lazygit = {
        win = {
          width = 0.98,
          height = 0.98,
        },
      },
    },
  },
}
