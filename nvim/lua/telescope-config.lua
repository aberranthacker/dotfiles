--require('telescope').setup{
--  defaults = {
--    vimgrep_arguments = {
--      'rg', '--color=never',
--      '--no-heading',
--      '--with-filename',
--      '--line-number',
--      '--column',
--      '--smart-case'
--    },
--    prompt_prefix = "> ",
--    selection_caret = "> ",
--    entry_prefix = "  ",
--    initial_mode = "insert",
--    selection_strategy = "reset",
--    sorting_strategy = "descending",
--    layout_strategy = "horizontal",
--    layout_config = {
--      horizontal = {
--        mirror = false,
--      },
--      vertical = {
--        mirror = false,
--      },
--    },
--    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
--    file_ignore_patterns = {},
--    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
--    winblend = 0,
--    border = {},
--    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
--    color_devicons = true,
--    use_less = true,
--    path_display = {},
--    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
--    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
--    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
--    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
--
--    -- Developer configurations: Not meant for general override
--    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
--  }
--}  
--
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
-- Find files using Telescope command-line sugar.
--nnoremap("<leader>p", "<cmd>Telescope find_files<cr>")
--nnoremap("<leader>f", "<cmd>Telescope live_grep<cr>")
--nnoremap("<leader>b", "<cmd>Telescope buffers<cr>")
--nnoremap("<leader>hh", "<cmd>Telescope help_tags<cr>")
