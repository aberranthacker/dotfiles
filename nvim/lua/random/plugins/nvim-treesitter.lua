return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  keys = {
    { '<Leader>tu', ':TSUpdate<CR>', desc = 'Treesitter: [u]pdate' },
    { '<Leader>tt', ':TSPlaygroundToggle<CR>', desc = 'Treesitter: [t]oggle playground' },
    { '<Leader>tn', ':TSNodeUnderCursor<CR>', desc = 'Treesitter: Show [n]ode' },
    {
      '<Leader>th',
      ':TSHighlightCapturesUnderCursor<CR>',
      desc = 'Treesitter: Show [h]ighlight group',
    },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground', --  Treesitter playground integrated into Neovim
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise', -- wisely add "end" in Ruby, Lua, Vimscript, etc.
  },
  build = ':TSUpdate',
  config = function()
    -- [[ Configure Treesitter ]]
    -- See `:help nvim-treesitter`
    -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'css',
          'git_config',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
          'go',
          'lua',
          'markdown',
          'markdown_inline',
          'python',
          'query',
          'ruby',
          'rust',
          'ssh_config',
          'sql',
          'tsx',
          'javascript',
          'typescript',
          'vimdoc',
          'vim',
          'vue',
          'xml',
          'yaml',
        },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,

        highlight = { enable = true },
        indent = {
          enable = true,
          disable = { 'ruby' },
        },
        autotag = { enable = true }, -- enable autotagging (with nvim-ts-autotag plugin)
        endwise = { enable = true }, -- enable wise addition of end (with 'nvim-treesitter-endwise')
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-Space>',
            node_incremental = '<C-Space>',
            scope_incremental = false,
            node_decremental = '<C-S-space>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['am'] = '@function.outer',
              ['im'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      })

      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
      parser_config.vm2 = {
        install_info = {
          url = '~/retrodev/tree-sitter-vm2', -- local path or git repo
          files = { 'src/parser.c' }, -- note that some parsers also require src/scanner.c or src/scanner.cc
          -- optional entries:
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        -- filetype = 'gas', -- if filetype does not match the parser name
      }
    end, 0)
  end,
}
