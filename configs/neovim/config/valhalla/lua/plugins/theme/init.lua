return {
  priority = 1000,
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },   -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },   -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    init = function()
      require "plugins.theme.startup"
    end,
  },   -- Theme
  {
    "navarasu/onedark.nvim",
    lazy = true,
  },   -- Theme
  {
    "Yagua/nebulous.nvim",
    lazy = true,
  },   -- Theme
}
