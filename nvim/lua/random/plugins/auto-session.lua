return  {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require('auto-session')
    local minutes = 60000

    auto_session.setup {
      log_level = 'error', -- default: info, options: 'debug', 'info', 'error'
      auto_session_suppress_dirs = {'~/', '~/Downloads', '/'},
    }

    vim.defer_fn(function()
      vim.fn.timer_start(
        1 * minutes,
        function()
          auto_session.SaveSession()
        end,
        {['repeat'] = -1}
      )
    end, 1000)
  end
}
