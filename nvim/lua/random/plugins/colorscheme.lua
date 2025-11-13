return {
  -- Colorschemes
  -- 'rafi/awesome-vim-colorschemes',
  -- {
  --   'gruvbox-community/gruvbox', -- Retro groove color scheme for Vim
  --   config = function()
  --     --https://github.com/gruvbox-community/gruvbox/wiki/Configuration
  --     vim.g.gruvbox_contrast_dark = 'hard' -- soft, medium, hard
  --     vim.g.gruvbox_contrast_light = 'hard'
  --     vim.g.gruvbox_italic = 1
  --     vim.g.gruvbox_italicize_comments = 0
  --     vim.g.gruvbox_improved_strings = 0
  --     vim.g.gruvbox_improved_warnings = 0
  --     -- vim.g.gruvbox_number_column = 'bg0'
  --     -- vim.g.gruvbox_sign_column = 'bg0'
  --   end,
  -- },
  'NLKNguyen/papercolor-theme',
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
  {
    'sainnhe/gruvbox-material',
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup({
        -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        style = 'dark',
      })
    end,
  },
  {
    'xolox/vim-colorscheme-switcher',
    dependencies = { 'xolox/vim-misc' },
    config = function()
      vim.opt.background = 'dark'
      -- vim.cmd('colorscheme gruvbox8_soft') -- "soft" contrast
      -- vim.cmd('colorscheme gruvbox8') -- "medium" contrast
      vim.cmd('colorscheme gruvbox8_hard') -- "hard" contrast
      -- vim.cmd('colorscheme retrobox')
      -- vim.cmd('colorscheme gruvbox-material')
    end,
  },
}
