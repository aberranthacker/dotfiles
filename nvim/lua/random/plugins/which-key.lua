return {
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      local wk = require('which-key')

      wk.add({
        { '<leader>o', name = 'Obsidian/Org-mode' },
        { '<leader>s', name = 'Search' },
        { '<leader>t', name = 'Treesitter and various' },
      })
    end,
  },
}
