return {
  -- Colorschemes
  {
    'gruvbox-community/gruvbox', -- Retro groove color scheme for Vim
    config = function()
      vim.opt.background = 'dark'
      -- https://github.com/morhetz/gruvbox/wiki/Terminal-specific
      vim.cmd('colorscheme gruvbox')
      vim.g.gruvbox_contrast_dark = 'medium'
      vim.g.gruvbox_contrast_light = 'hard'
      vim.g.gruvbox_italic = 1
    end
  },
  'rafi/awesome-vim-colorschemes',
  --{'xolox/vim-colorscheme-switcher', requires = {'xolox/vim-misc'}},
}
