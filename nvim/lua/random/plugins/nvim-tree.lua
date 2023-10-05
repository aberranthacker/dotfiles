return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      local nvimtree = require("nvim-tree")

      -- recommended setting from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- change color for arrows in tree
      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

      nvimtree.setup({
        view = {
          width = 30, -- default width is 30
        },
        renderer = {
          icons = {
            padding = '',
            show = {
              file = false,
              folder = false,
              folder_arrow = true,
              git = true,
              modified = true,
              diagnostics = true,
              bookmarks = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              bookmark = "󰆤",
              modified = "●",
              folder = {
                arrow_closed = "▸",
                arrow_open = "▾",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "-",
                ignored = "◌",
              },
            },
          },
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })

      -- set keymaps
      --noremap('<BS>', ':NvimTreeToggle<cr>')
      vim.keymap.set('n', '<BS>', '<cmd>NvimTreeFindFile<cr>')
    end
  },
}
