--------------------------------------------------------------------------------
-- “When you look at the dark side, careful you must be.
--  For the dark side looks back.” - Yoda
--------------------------------------------------------------------------------
-- This must be first, because it changes other options as side effect
vim.opt.compatible = false -- be iMproved
--------------------------------------------------------------------------------
-- nvim-tree.lua requires to disable netrw at the very start of the init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--------------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'plugins'
require 'settings'
require 'keymaps'
require 'autocommands'

require 'nvim-tree-config'
require 'pomodoro-config'
require 'telescope-config'
require 'nvim-treesitter-confing'
require 'vimwiki-config'
require 'lsp-config'
require 'nvim-cmp-config'
