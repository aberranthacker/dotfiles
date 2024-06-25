return {
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      local wk = require('which-key')

      wk.register({
        o = { name = 'Obsidian/Org-mode' },
        s = { name = 'Search' },
        t = { name = 'Telescope/Treesitter' },
      }, { prefix = '<leader>' })
    end,
  },
}
