-- Pull in the wezterm API
local wezterm = require('wezterm')

-- Maximize window on startup
-- wezterm.on('gui-startup', function(cmd)
--   local _tab, _pane, window = wezterm.mux.spawn_window(cmd or {})
--   window:gui_window():maximize()
-- end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- "Normal" - This corresponds to the default hinting algorithm,
--            optimized for standard gray-level rendering.
--            This is the default setting.
-- "Light" - A lighter hinting algorithm for non-monochrome modes.
--           Many generated glyphs are more fuzzy but better resemble its original shape.
--           A bit like rendering on Mac OS X.
-- "Mono" - Strong hinting algorithm that should only be used for monochrome output.
--          The result is probably unpleasant if the glyph is rendered in non-monochrome modes.
-- "HorizontalLcd" - A subpixel-rendering variant of Normal optimized for horizontally decimated LCD displays.
config.freetype_load_target = 'HorizontalLcd'
config.font = wezterm.font('Cascadia Code')
-- config.font = wezterm.font('Terminess Powerline', { weight = 'Bold' })
-- config.font = wezterm.font('UnifontExMono')
-- config.font = wezterm.font('Unifont')
-- config.font = wezterm.font('Unifont', { weight = 'Regular', stretch = 'Normal', style = 'Normal' })
-- config.font = wezterm.font('Cozette')
-- config.font = wezterm.font('CozetteHiDpi')
config.font_size = 11

config.enable_tab_bar = false
config.window_decorations = 'NONE' -- default value 'TITLE | RESIZE'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.audible_bell = 'Disabled'
config.visual_bell = {
  fade_in_duration_ms = 75,
  fade_out_duration_ms = 75,
  target = 'CursorColor',
}

-- config.color_scheme = 'Breeze (Gogh)'
-- config.color_scheme = 'Catppuccin Latte' -- Mocha, Macchiato, Frappe, Latte
config.color_scheme = 'PaperColor'
-- config.color_scheme = 'Borland'

config.default_cursor_style = 'BlinkingBlock'

config.keys = {
  {
    key = 'F11',
    -- mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

config.selection_word_boundary = ' \t\n{}[]()"\'`,;:' -- default value ' \t\n{}[]()"\'`'

return config
