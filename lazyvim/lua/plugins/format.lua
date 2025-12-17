return {
  {
    'LazyVim/LazyVim',
    opts = function(_, opts)
      opts.format = opts.format or {}
      -- LazyVim’s on-save formatting timeout
      opts.format.timeout_ms = 10000
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}

    -- stylua: ignore start
    opts.formatters.rubocop = vim.tbl_deep_extend("force", opts.formatters.rubocop or {}, {
      prefer_local = "bin",                 -- stick to project's bin/rubocop
      env = { BUNDLE_QUIET = "1", NO_COLOR = "1" }, -- bundler: be quiet; kill ANSI just in case
      stdin = false,                        -- switch to tempfile mode → stdout noise can't touch the buffer
      args = {
        "--autocorrect-all",                -- do the fixes (same as -A)
        "--format", "quiet",                -- don't print progress/summary
        "--no-color",                       -- no ANSI sequences
        "--force-exclusion",                -- still honor .rubocop.yml excludes
        "$FILENAME",                        -- Conform will pass the temp file path here
      },
      exit_codes = { 0, 1 },                -- rubocop uses 1 when it fixes offenses; treat as success
    })
      -- stylua: ignore end
    end,
  },
}
