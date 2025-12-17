return {
  'hrsh7th/nvim-cmp',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function(_, opts)
    local cmp = require('cmp')
    local curl = require('plenary.curl')

    -- Minimal Bothub cmp source
    local BothubSource = {}
    BothubSource.new = function()
      local self = setmetatable({}, { __index = BothubSource })
      self.api_base = vim.env.OPENAI_API_BASE or 'https://bothub.chat/api/v2/openai/v1'
      self.api_key = vim.env.OPENAI_API_KEY
      self.model = 'gpt-4o-mini' -- change to your preferred Bothub model
      self.max_tokens = 128
      return self
    end

    -- Required
    function BothubSource:get_debug_name()
      return 'bothub'
    end

    -- Allow triggering anywhere (not only after word chars)
    function BothubSource:get_keyword_pattern()
      return '.'
    end

    -- Optional: let cmp know it’s async
    function BothubSource:is_incomplete()
      return true
    end

    function BothubSource:is_available()
      return self.api_key ~= nil
    end

    -- Called by cmp when it wants completion items
    function BothubSource:complete(request, callback)
      -- Simple guard
      if not self.api_key then
        callback({})
        return
      end

      -- Context around cursor
      local bufnr = request.context.bufnr
      local row = request.context.cursor.row
      local col = request.context.cursor.col

      local lines = vim.api.nvim_buf_get_lines(bufnr, math.max(0, row - 80), row + 1, false)
      local before_line = (vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1] or '')
      local prefix = before_line:sub(1, col)

      -- Build a minimal prompt for next-token/code completion
      local prompt = table.concat({
        'You are a code completion engine. Predict the next few tokens.',
        'Return only the code suggestion without explanations.',
        'Language: ' .. (vim.bo[bufnr].filetype or 'text'),
        'Context (current line up to cursor):',
        prefix,
      }, '\n')

      local url = self.api_base .. '/chat/completions'

      curl.post(url, {
        headers = {
          ['Content-Type'] = 'application/json',
          ['Authorization'] = 'Bearer ' .. self.api_key,
        },
        body = vim.json.encode({
          model = self.model,
          temperature = 0.2,
          max_tokens = self.max_tokens,
          messages = {
            { role = 'system', content = 'Return only the code completion. No explanations.' },
            { role = 'user', content = prompt },
          },
        }),
        callback = function(res)
          if res.status ~= 200 then
            -- Uncomment for debugging:
            -- vim.schedule(function()
            --   vim.notify(("Bothub cmp error %s: %s"):format(res.status, res.body or ""), vim.log.levels.WARN)
            -- end)
            callback({})
            return
          end
          local ok, data = pcall(vim.json.decode, res.body)
          if not ok or not data or not data.choices or not data.choices[1] then
            callback({})
            return
          end
          local text = (data.choices[1].message and data.choices[1].message.content or ''):gsub(
            '^%s+',
            ''
          )
          if text == '' then
            callback({})
            return
          end

          -- Single completion item; cmp will show it and ghost-text can render it
          local item = {
            label = text,
            insertText = text,
            kind = cmp.lsp.CompletionItemKind.Text,
          }
          callback({ item })
        end,
      })
    end

    -- REGISTER THE CLASS, NOT AN INSTANCE
    cmp.register_source('bothub', BothubSource)

    -- Ensure auto-completion is on for text changes
    opts.completion = opts.completion or {}
    opts.completion.autocomplete = opts.completion.autocomplete
      or {
        cmp.TriggerEvent.TextChanged,
      }

    -- Enable ghost text (LazyVim may already set this; keep it on)
    opts.experimental = opts.experimental or {}
    opts.experimental.ghost_text = true

    -- Add our source with a reasonable priority (lower than LSP/snippets)
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources or {}, {
      { name = 'bothub', keyword_length = 1, priority = 30 },
    }))

    -- Provide a confirm mapping if you don’t already have one
    opts.mapping = opts.mapping or {}
    opts.mapping['<Tab>'] = opts.mapping['<Tab>'] or cmp.mapping.confirm({ select = true })
  end,
}
