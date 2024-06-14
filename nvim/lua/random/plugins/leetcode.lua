return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim', -- required by telescope
    'MunifTanjim/nui.nvim',

    -- optional
    'nvim-treesitter/nvim-treesitter',
    'rcarriga/nvim-notify',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    lang = 'ruby',
    -- keys = {
    --   menu = '<leader>lm',
    -- },
    --
    -- Create an autocommand group for LeetCode key mappings
    vim.api.nvim_create_augroup('LeetCodeGroup', { clear = true }),

    vim.api.nvim_create_autocmd('FileType', {
      group = 'LeetCodeGroup',
      callback = function()
        local buf_nmap = function(keys, action, desc)
          vim.api.nvim_buf_set_keymap(
            vim.api.nvim_get_current_buf(),
            'n',
            keys,
            action,
            { noremap = true, silent = true, desc = desc }
          )
        end

        -- Define buffer-local key mappings
        buf_nmap('<leader>ls', ':Leet submit<CR>', 'Leetcode: [s]ubmit')
        buf_nmap('<leader>lt', ':Leet test<CR>', 'Leetcode: [t]est')
        buf_nmap('<leader>li', ':Leet info<CR>', 'Leetcode: [i]info')
        buf_nmap('<leader>lm', ':Leet menu<CR>', 'Leetcode: [m]enu')
        -- Add more buffer-local mappings as needed
      end,
    }),
  },
}
