require("nvim-tree").setup({
  view = {
    width = 30, -- default width is 30
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
        default = "",
        symlink = "",
        bookmark = "󰆤",
        modified = "●",
        folder = {
          arrow_closed = "▸",
          arrow_open = "▾",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "-",
          ignored = "◌",
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

-- -- auto close
-- local function is_modified_buffer_open(buffers)
--     for _, v in pairs(buffers) do
--         if v.name:match("NvimTree_") == nil then
--             return true
--         end
--     end
--     return false
-- end
-- 
-- vim.api.nvim_create_autocmd("BufEnter", {
--     nested = true,
--     callback = function()
--         if
--             #vim.api.nvim_list_wins() == 1
--             and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
--             and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
--         then
--             vim.cmd("quit")
--         end
--     end,
-- })
