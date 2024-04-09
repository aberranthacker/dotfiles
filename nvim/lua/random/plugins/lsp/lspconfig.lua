return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' }, -- when opening preexisted of new file in a buffer
  dependencies = {
    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    -- [[ Configure LSP ]]
    -- Setup neovim lua configuration
    require('neodev').setup()
    -- import lspconfig plugin
    local lspconfig = require('lspconfig')

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- NOTE: Remember that lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself
      -- many times.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end
      local telescope_builtin = require('telescope.builtin')

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      nmap('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
      nmap('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      nmap('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      nmap('[d', vim.diagnostic.goto_prev, 'Goto Previous [D]iagnosic')
      nmap(']d', vim.diagnostic.goto_next, 'Goto Next [D]iagnosic')
      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      --nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end -- end of on_attach function

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    lspconfig['cssls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig['html'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'html', 'twig', 'hbs' },
    })

    lspconfig['gopls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig['lua_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          -- list of all settings can be found here
          -- https://github.com/LuaLS/lua-language-server/wiki/Settings
          workspace = {
            -- make the language server aware of runtime files
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.stdpath('config') .. '/lua'] = true,
            checkThirdParty = false
          },
          telemetry = { enable = false },
          diagnostics = {
            diagnostics = {
              global = 'vim', -- make the language server recognize "vim" global
            },
            disable = {
              'missing-fields',
            }
          }
        },
      },
    })

    lspconfig['sqlls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig['tsserver'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
}
