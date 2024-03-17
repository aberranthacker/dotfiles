return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer', -- completion source for text in buffer
      'hrsh7th/cmp-path', -- completions source for file system paths
      'L3MON4D3/LuaSnip', -- Snippet Engine & its associated nvim-cmp source
      'saadparwaiz1/cmp_luasnip', -- completion source for the snippets
      'rafamadriz/friendly-snippets', -- Adds a number of user-friendly snippets
      'delphinus/cmp-ctags', -- Universal Ctags source
    },
    config = function()
      -- [[ Configure nvim-cmp ]]
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        completion = {
          completeops = 'menu,menuone,preview,noselect', -- :h completeops
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
          ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {}, -- show completion suggestions
          ['<C-e>'] = cmp.mapping.abort(), -- close completion window
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = { -- sources for autocompletion
          -- suggestions will be shown in the order below
          {
            name = 'ctags',
            options = {
              trigger_characters = { '.' },
              trigger_characters_ft = {
                ruby = { '.', '::' }
              }
            }
          },
          { name = 'nvim_lsp' }, -- LSP
          { name = 'luasnip' }, -- snippets
          {
            name = 'buffer',
            option = {
              get_bufnrs = function()
                -- return vim.api.nvim_get_current_buf() -- default, current buffer as source
                return vim.api.nvim_list_bufs() -- but we want all buffers as source
              end
            }
          },
          { name = 'path' }, -- file system paths
        },
      }
    end
  },
}
