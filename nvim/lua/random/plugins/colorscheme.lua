return {
  -- Colorschemes
  -- 'rafi/awesome-vim-colorschemes',
  {
    'xolox/vim-colorscheme-switcher',
    dependencies = { 'xolox/vim-misc' },
  },
  {
    'gruvbox-community/gruvbox', -- Retro groove color scheme for Vim
    config = function()
      --https://github.com/gruvbox-community/gruvbox/wiki/Configuration
      vim.opt.background = 'dark'
      vim.g.gruvbox_contrast_dark = 'medium'
      vim.g.gruvbox_contrast_light = 'hard'
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_italicize_comments = 0
      vim.g.gruvbox_improved_strings = 0
      vim.g.gruvbox_improved_warnings = 0
      -- vim.g.gruvbox_number_column = 'bg0'
      -- vim.g.gruvbox_sign_column = 'bg0'
      vim.cmd('colorscheme gruvbox')
    end,
  },
  'NLKNguyen/papercolor-theme',
}
