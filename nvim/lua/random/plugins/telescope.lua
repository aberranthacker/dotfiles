return {
  -- Fuzzy Finder (files, lsp, etc)
  -- replaces any search plugin you used (ctrl-p, fzf.vim etc.)
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        mappings = {
          -- insert mode
          i = {
            -- move to prev result
            ['<C-k>'] = actions.move_selection_previous,
            -- move to next result
            ['<C-j>'] = actions.move_selection_next,
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
        path_display = { -- :h telescope.defaults.path_display
          -- truncates the start of the path when the whole path will
          truncate = true,
        },
      },
    })

    -- Enable telescope fzf native
    telescope.load_extension('fzf')

    telescope.load_extension('undo')

    local builtin = require('telescope.builtin')
    local utils = require('telescope.utils')
    local nmap = function(keys, action, desc)
      vim.keymap.set('n', keys, action, { desc = desc })
    end

    -- See `:help telescope.builtin`
    nmap('<leader>f', builtin.find_files, 'Search [f]iles')
    nmap('<leader>F', function()
      builtin.find_files({ cwd = utils.buffer_dir() })
    end, 'Search [F]iles relative to open buffer')
    nmap('<leader>r', builtin.oldfiles, 'Find [r]ecently opened files')
    nmap('<leader>b', builtin.buffers, 'Find existing [b]uffers')
    nmap('<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, '[/] Fuzzily search in current buffer')

    nmap('<leader>gf', builtin.git_files, 'Telescope: Search (g)it [f]iles')

    nmap('<leader>sc', function()
      builtin.find_files({ search_dirs = { 'app/controllers' } })
    end, 'Telescope: (s)earch [c]ontrollers')
    nmap('<leader>sm', function()
      builtin.find_files({ search_dirs = { 'app/models' } })
    end, 'Telescope: (s)earch [m]odels')
    nmap('<leader>sv', function()
      builtin.find_files({ search_dirs = { 'app/views' } })
    end, 'Telescope: (s)earch [v]iews')

    nmap('<leader>sd', builtin.diagnostics, 'Telescope: (s)earch [d]iagnostics')
    nmap('<leader>sg', builtin.live_grep, 'Telescope: (s)earch by [g]rep')
    nmap('<leader>sh', builtin.help_tags, 'Telescope: (s)earch [h]elp')
    nmap('<leader>sw', builtin.grep_string, 'Telescope: (s)earch current [w]ord')

    nmap('<Leader>tc', builtin.colorscheme, 'Telescope: (s)earch [c]oloroschemes')
    nmap('<Leader>tk', builtin.keymaps, 'Telescope: (s)earch [k]eymaps')

    -- Opens the previous picker in the identical state (incl. multi selections)
    nmap('<leader>sp', builtin.resume, 'Telescope: (s)earch [p]revious')

    nmap('<F5>', '<CMD>Telescope undo<CR>', 'Telescope: undo')
  end,
}
