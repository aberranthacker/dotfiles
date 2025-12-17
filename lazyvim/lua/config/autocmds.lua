-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Make the current window big, but leave others context
-- Autocommand to adjust window settings based on buffer type

-- Per-filetype minimum width policy.
-- NOTE: 'winwidth' is a *global* option in Neovim:
-- whatever value you set affects the whole editor layout, not just one window.
-- Therefore we must always reset it on window/buffer changes, otherwise the
-- last "big" value (e.g. ruby=126) will keep influencing unrelated UI windows
-- like pickers, prompts, etc.
local ft_width = {
  NvimTree = 40,
  ruby = 126,
  Avante = 80,
}

-- Safe default for everything that is not a "real editing window".
-- (Also used for filetypes not listed in ft_width.)
local default_width = 20

local group = vim.api.nvim_create_augroup('WinWidthByFiletype', { clear = true })

-- Pickers and many UI components are implemented as floating windows.
-- For floating windows we don't want a large global 'winwidth', because it can
-- force Neovim to resize other splits and break the UI layout.
local function is_floating(win)
  local cfg = vim.api.nvim_win_get_config(win)
  return cfg.relative ~= '' -- non-empty means "floating"
end

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  group = group,
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_get_current_buf()

    -- Use buffer-scoped option access to avoid ambiguity about "current buffer".
    local ft = vim.bo[buf].filetype
    local bt = vim.bo[buf].buftype

    -- Start from the safe baseline.
    -- Important: we *always* set winwidth (global), even for special windows.
    -- If we "return early", the previous value would remain and still affect
    -- the picker/special window.
    local width = default_width

    -- Only apply per-filetype widths to "normal editing" buffers in normal windows.
    --
    -- Why these checks exist:
    --   - bt ~= "" catches UI buffers: prompt/nofile/help/quickfix/terminal/etc.
    --     Those should NOT trigger large winwidth values.
    --   - floating windows are usually pickers/menus/popups; applying a large
    --     global winwidth can make Neovim aggressively resize regular splits,
    --     which breaks those UIs.
    if bt == '' and not is_floating(win) then
      width = ft_width[ft] or default_width
    end

    vim.opt_global.winwidth = width
  end,
})
