return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    quickfile = { enabled = true },
    bigfile = { enabled = true },
  },
  keys = {},
  init = function() end,
}
