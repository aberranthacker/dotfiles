return {
  'yetone/avante.nvim',
  config = function(_, opts)
    -- Use only the OpenAI provider via Bothub
    opts = opts or {}
    opts.provider = 'openai'
    opts.providers = {
      openai = {
        api_key = vim.env.OPENAI_API_KEY,
        endpoint = vim.env.OPENAI_API_BASE or 'https://bothub.chat/api/v2/openai/v1',
        base_url = vim.env.OPENAI_API_BASE or 'https://bothub.chat/api/v2/openai/v1',
        model = 'gpt-5.1-codex',
        extra_request_body = {
          temperature = 0.2,
          max_tokens = 20480,
        },
      },
      -- Do not include `copilot` here
    }

    -- Stub Copilot provider module so any attempt to require it is a no-op
    package.preload['avante.providers.copilot'] = function()
      return {
        name = 'copilot',
        enabled = false,
        setup = function() end,
        list_models = function(_)
          return {}
        end,
        refresh_token = function()
          return nil
        end,
      }
    end

    -- Now set up Avante
    require('avante').setup(opts)
  end,
}
