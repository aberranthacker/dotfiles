return  {
  'rmagatti/auto-session',
  opts = {
    log_level = 'error', -- default: info, options: 'debug', 'info', 'error'
    auto_session_suppress_dirs = {'~/', '~/Downloads', '/'},
  },
  config = function()
    local auto_session = require 'auto-session'

    -- Save session every 5 minutes
    local function save_session_periodically()
      auto_session.AutoSaveSession()
    end

    vim.defer_fn(function()
      vim.fn.timer_start(5 * 60 * 1000, save_session_periodically, {['repeat'] = -1})
    end, 0)
  end
}
