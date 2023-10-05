--------------------------------------------------------------------------------
-- “When you look at the dark side, careful you must be.
--  For the dark side looks back.” - Yoda
--------------------------------------------------------------------------------
-- This must be first, because it changes other options as side effect
vim.opt.compatible = false -- be iMproved
--------------------------------------------------------------------------------
-- nvim-tree.lua requires to disable netrw at the very start of the init.lua
--------------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'random.core.settings'
require 'random.core.keymaps'
require 'random.core.autocommands'
