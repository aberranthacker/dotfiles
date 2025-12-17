return {
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'gruvbox8_hard',
    },
  },

  -- { 'ellisonleao/gruvbox.nvim' },

  {
    'lifepillar/vim-gruvbox8',
    branch = 'neovim',
    config = function()
      -- Set to 0 if you do not want to enable italics.
      vim.g.gruvbox_italics = 1
      -- Note: setting following to 1 may leave "a wake of destruction when switching away"
      vim.g.gruvbox_filetype_hi_groups = 1
      vim.g.gruvbox_plugin_hi_groups = 1
    end,
  },
}
