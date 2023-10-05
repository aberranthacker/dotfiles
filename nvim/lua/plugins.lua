-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  -- a Git wrapper so awesome, it should be illegal
  'tpope/vim-fugitive',
  -- If fugitive.vim is the Git, rhubarb.vim is the Hub.
  'tpope/vim-rhubarb', -- ?

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  --{
  --   'tzachar/cmp-tabnine',
  --   build = './install.sh',
  --   dependencies = 'hrsh7th/nvim-cmp',
  --   config = function()
  --     local tabnine = require('cmp_tabnine.config')
  --     tabnine:setup({
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --       run_on_every_keystroke = true,
  --       snippet_placeholder = '..',
  --       ignored_file_types = {
  --         -- default is not to ignore
  --         -- uncomment to ignore in lua:
  --         -- lua = true
  --       },
  --       show_prediction_strength = false
  --     })
  --   end
  -- },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

   -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  -- replaces any search plugin you used (ctrl-p, fzf.vim etc.)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
--------------------------------------------------------------------------------
  -- Colorschemes
  'gruvbox-community/gruvbox', -- Retro groove color scheme for Vim
  'rafi/awesome-vim-colorschemes',
  --{'xolox/vim-colorscheme-switcher', requires = {'xolox/vim-misc'}},

  -- Extended session management for Vim (:mksession on steroids)
  --{'xolox/vim-session', requires = {'xolox/vim-misc'}},

  -- Visualize your undo tree
  'mbbill/undotree',

  -- continuously updated session files
  'tpope/vim-obsession',

  -- use CTRL-A/CTRL-X to increment dates, times, and more
  'tpope/vim-speeddating',

  -- Projectionist provides granular project configuration using "projections".
  'tpope/vim-projectionist',

  -- Vim sugar for the UNIX shell commands that need it the most.
  'tpope/vim-eunuch',

  -- Dadbod is a Vim plugin for interacting with databases.
  -- It's a more modern take on dbext.vim, improving on it.
  'tpope/vim-dadbod',

  -- Abbreviation
  --
  -- Substitution
  --
  -- Coercion
  --
  -- Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
  -- MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru),
  -- dash-case (cr-), dot.case (cr.), space case (cr<space>),
  -- and Title Case (crt) are all just 3 keystrokes away.
  -- https://github.com/tpope/vim-abolish
  'tpope/vim-abolish',

  -- If you've ever tried using the . command after a plugin map, you were likely
  -- disappointed to discover it only repeated the last native command inside that
  -- map, rather than the map as a whole.
  -- That disappointment ends today.
  -- Repeat.vim remaps . in a way that plugins can tap into it.
  -- https://github.com/tpope/vim-repeat
  'tpope/vim-repeat',

  -- Seamless switching between VIM windows and Tmux panes
  'christoomey/vim-tmux-navigator',

  -- Bbye allows you to do delete buffers (close files) without closing your
  -- windows or messing up your layout.
  'olegtc/vim-bbye',

  -- Plug for the Pomodoro time management technique.
  'tricktux/pomodoro.vim',

  -- Maximizes and restores the current window in Vim.
  'szw/vim-maximizer',

  -- A Vim plugin that manages your tag files bolt80.com/gutentags
  'ludovicchabant/vim-gutentags',

  -- Jump to any definition and references 👁 IDE madness without overhead 🚀
  'pechorin/any-jump.vim',

  -- A Personal Wiki For Vim
  'vimwiki/vimwiki',
  
  -- Text outlining and task management for Vim based on Emacs' Org-Mode
  'jceb/vim-orgmode',

  -- Asynchronous Lint Engine
  'w0rp/ale',

  -- provides extended matching for the % operator
  'adelarsq/vim-matchit' ,

  -- ruby
  { 'vim-ruby/vim-ruby', ft = 'ruby' },
  { 'ecomba/vim-ruby-refactoring', ft = 'ruby', dependencies = { 'adelarsq/vim-matchit' } },
  -- Ruby on Rails power tools
  'tpope/vim-rails',
  -- vim plugin for highliting code in ruby here document
  'joker1007/vim-ruby-heredoc-syntax',

  -- Improved nginx vim plugin (incl. syntax highlighting)
  'chr4/nginx.vim',
    -- Syntax highlighting for GNU Octave
  'jvirtanen/vim-octave',
  -- CoffeeScript support for vim
  'kchmck/vim-coffee-script',
  -- Slim syntax highlighting for vim.
  'slim-template/vim-slim',
  -- Vastly improved Javascript indentation and syntax support in Vim.
  'pangloss/vim-javascript',
  -- Syntax Highlight for Vue.js components
  'posva/vim-vue',
  -- React JSX syntax highlighting and indenting for vim.
  'mxw/vim-jsx',
  -- List of JavaScript ES6 snippets and syntax highlighting for vim.
  'isRuslan/vim-es6',
  -- Syntax for PDP11 assembly
  'olegtc/asmpdp11',
  -- PDP11 syntax for GNU assembler
  'aberranth/vim-gas-pdp11',
  -- Syntax for Z80 assembly
  'cpcsdk/vim-z80-democoding',
  -- Arduino IDE intregation for vim.
  '4Evergreen4/vim-hardy',

  -- The best PostgreSQL plugin for Vim!
  'lifepillar/pgsql.vim',

  {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },

  --{
  --  'codota/tabnine-nvim',
  --  run = "./dl_binaries.sh",
  --  config = function()
  --    require('tabnine').setup({
  --      disable_auto_comment=true,
  --      accept_keymap="<Tab>",
  --      dismiss_keymap = "<C-]>",
  --      debounce_ms = 800,
  --      suggestion_color = {gui = "#808080", cterm = 244},
  --      exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  --      log_file_path = nil, -- absolute path to Tabnine log file
  --    })
  --  end
  --},

  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = {'~/', '~/Downloads', '/'},
      }
    end
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- { import = 'custom.plugins' },
}, {})
