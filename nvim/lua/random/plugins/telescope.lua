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
            -- send selected result to quick-fix list
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
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

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search [F]iles' })
    vim.keymap.set('n', '<leader>r', builtin.oldfiles, { desc = 'Find [R]ecently opened files' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find existing [B]uffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- Opens the previous picker in the identical state (incl. multi selections)
    vim.keymap.set('n', '<leader>sp', builtin.resume, { desc = '[S]earch [P]revious' })
    vim.keymap.set('n', '<F5>', '<cmd>Telescope undo<cr>', { desc = 'Invoke telescope-undo' })

    vim.keymap.set('n', '<Leader>tc', '<cmd>Telescope colorscheme<CR>', { desc = 'Telescope: [c]oloroscheme' })
  end,
}
