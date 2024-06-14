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
      vim.g.gruvbox_legacy_language_groups = false
      vim.g.gruvbox_number_column = 'dark0_hard'
      vim.g.gruvbox_sign_column = 'dark0_hard'
      --vim.g.gruvbox_color_column = 'dark0_hard'
      vim.cmd('colorscheme gruvbox')
    end,
  },
  {
    'https://gitlab.com/bartekjaszczak/distinct-nvim',
    priority = 1000,
    config = function()
      require('distinct').setup({
        doc_comments_different_color = true, -- Use different colour for documentation comments
      })
    end,
  },
  {
    'sekke276/dark_flat.nvim',
    -- config = function()
    --   require('dark_flat').setup({
    --     transparent = true, -- enable transparent window
    --   })
    -- end,
  },
  'NLKNguyen/papercolor-theme',
  'cpea2506/one_monokai.nvim',
  -- 'ray-x/starry.nvim',
}
