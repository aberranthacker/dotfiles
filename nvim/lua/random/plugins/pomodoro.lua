return {
  -- Plug for the Pomodoro time management technique.
  'tricktux/pomodoro.vim',
  config = function()
    -- Duration of a pomodoro in minutes (default: 25)
    vim.g.pomodoro_time_work = 25
    -- Duration of a break in minutes (default: 5)
    vim.g.pomodoro_time_slack = 5
    -- Log completed pomodoros, 0 = False, 1 = True (default: 0)
    vim.g.pomodoro_do_log = 1
    -- Path to the pomodoro log file (default: /tmp/pomodoro.log)
    vim.g.pomodoro_log_file = '/home/random/pomodoro.log'
    vim.g.pomodoro_notification_cmd = 'zenity --notification --text="Pomodoro finished"'
  end
}
