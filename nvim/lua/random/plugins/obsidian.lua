vim.keymap.set('n', '<Leader>on', '<cmd>ObsidianNew<CR>', { desc = 'Obsidian[N]ew' })
vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianSearch<cr>', { desc = 'Obsidian[S]earch' })
vim.keymap.set('n', '<leader>os', '<cmd>ObsidianQuickSwitch<cr>', { desc = 'ObsidianQuick[S]witch' })
vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<cr>', { desc = 'Obsidian[B]acklinks' })
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTemplate<cr>', { desc = 'Obsidian[T]emplate' })
vim.keymap.set('n', '<leader>of', '<cmd>ObsidianFollowLink<cr>', { desc = 'Obsidian[F]ollowLink' })
vim.keymap.set('n', '<leader>od', '<cmd>ObsidianDailies<cr>', { desc = 'Obsidian[D]ailies' })

-- https://www.youtube.com/watch?v=5ht8NYkU9wQ
-- https://github.com/omerxx/dotfiles/blob/master/nvim/lua/plugins/obsidian.lua
return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  cmd = {
    'ObsidianBacklinks',
    'ObsidianCheck',
    'ObsidianDailies',
    'ObsidianDebug',
    'ObsidianExtractNote',
    'ObsidianFollowLink',
    'ObsidianLink',
    'ObsidianLinkNew',
    'ObsidianLinks',
    'ObsidianNew',
    'ObsidianOpen',
    'ObsidianPasteImg',
    'ObsidianQuickSwitch',
    'ObsidianRename',
    'ObsidianSearch',
    'ObsidianTags',
    'ObsidianTemplate',
    'ObsidianToday',
    'ObsidianToggleCheck',
    'ObsidianTomorrow',
    'ObsidianWorkspace',
    'ObsidianYesterday',
  },
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'base',
        path = '~/Dropbox/obsidian',
      },
      -- {
      --   name = 'work',
      --   path = '~/vaults/work',
      -- },
    },

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = 'daily',
      -- Optional, if you want to change the date format for the ID of daily notes.
      -- date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      -- alias_format = "%B %-d, %Y",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      -- template = nil
    },

    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    -- Where to put new notes. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = 'base',

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        -- suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        suffix = title
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          -- suffix = suffix .. string.char(math.random(65, 90))
          suffix = tostring(os.time()) .. '-' .. string.char(math.random(65, 90))
        end
      end
      -- return tostring(os.time()) .. '-' .. suffix
      return suffix
    end,

    -- Optional, boolean or a function that takes a filename and returns a boolean.
    -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
    disable_frontmatter = true,

    -- Optional, for templates (see below).
    templates = {
      folder = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      -- vim.fn.jobstart({"open", url})  -- Shit OS
      vim.fn.jobstart({ 'xdg-open', url }) -- GNU Linux
    end,
  },
}
