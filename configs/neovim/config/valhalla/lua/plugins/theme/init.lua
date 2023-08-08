-- NOTE: You'll have to move lazy, priority and the config to the other
-- colorschemes when you change the theme in the theme.startup file

return {
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
    }, -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = true,
    }, -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require "plugins.theme.startup"
        end,
    }, -- Theme
    {
        "navarasu/onedark.nvim",
        lazy = true,
    }, -- Theme
    {
        "Yagua/nebulous.nvim",
        lazy = true,
    }, -- Theme
}
