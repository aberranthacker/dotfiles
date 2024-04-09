return {
  -- Plugins that don't require any configuration

  -- Git related plugins
  -- a Git wrapper so awesome, it should be illegal
  'tpope/vim-fugitive',
  -- If fugitive.vim is the Git, rhubarb.vim is the Hub.
  'tpope/vim-rhubarb', -- ?

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

-- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

   -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

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

  -- Maximizes and restores the current window in Vim.
  'szw/vim-maximizer',

  -- A Vim plugin that manages your tag files bolt80.com/gutentags
  'ludovicchabant/vim-gutentags',

  -- Jump to any definition and references 👁 IDE madness without overhead 🚀
  'pechorin/any-jump.vim',

  -- Text outlining and task management for Vim based on Emacs' Org-Mode
  'jceb/vim-orgmode',

  -- provides extended matching for the % operator
  'adelarsq/vim-matchit' ,

  -- This plugin is meant to simplify a task I've found too common in my workflow:
  -- switching between a single-line statement and a multi-line one.
  -- It offers the following default keybindings, which can be customized:
  --   - gS to split a one-liner into multiple lines
  --   - gJ (with the cursor on the first line of a block) to join a block into a
  --        single-line statement.
  'AndrewRadev/splitjoin.vim',

  -- ruby
  { 'vim-ruby/vim-ruby', ft = 'ruby' },
  { 'ecomba/vim-ruby-refactoring', ft = 'ruby', dependencies = { 'adelarsq/vim-matchit' } },
  -- Ruby on Rails power tools
  'tpope/vim-rails',

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
}
