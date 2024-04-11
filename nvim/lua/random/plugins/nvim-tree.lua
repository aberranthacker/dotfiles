return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local nvimtree = require('nvim-tree')

      -- recommended setting from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        -- use all default keymappings
        api.config.mappings.default_on_attach(bufnr)

        -- then remove some of the nvim-tree default keymappings
        vim.keymap.del('n', '<C-e>', { buffer = bufnr })
        vim.keymap.del('n', '<BS>', { buffer = bufnr })

        vim.keymap.set('n', 'w', api.node.navigate.parent_close, opts('Collapse Parent'))
      end

      nvimtree.setup({
        on_attach = on_attach,
        view = {
          -- the option is useless, overriden by autocommand in ../core/settings.lua:47
          -- width = 40, -- default width is 30
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
              default = '',
              symlink = '',
              bookmark = '󰆤',
              modified = '●',
              folder = {
                arrow_closed = '▸',
                arrow_open = '▾',
                default = '',
                open = '',
                empty = '',
                empty_open = '',
                symlink = '',
                symlink_open = '',
              },
              git = {
                unstaged = '✗',
                staged = '✓',
                unmerged = '',
                renamed = '➜',
                untracked = '★',
                deleted = '-',
                ignored = '◌',
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

      -- There is currently an issue with restoring nvim-tree fully when using
      -- rmagatti/auto-session.
      -- Upon restoring the session, nvim-tree buffer will be empty,
      -- sometimes positioned in strange places with random dimensions.
      -- This issue only happens when saving session with nvim-tree open.
      -- To prevent this the following autocmd is used:
      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        pattern = 'NvimTree*',
        callback = function()
          local api = require('nvim-tree.api')
          local view = require('nvim-tree.view')

          if not view.is_visible() then
            api.tree.open()
          end
        end,
      })

      -- set keymaps
      vim.keymap.set('n', '<BS>', '<cmd>NvimTreeToggle<cr>', {
        desc = 'nvim-tree: Toggle',
        noremap = true,
        silent = true,
        nowait = true,
      })
    end,
  },
}
