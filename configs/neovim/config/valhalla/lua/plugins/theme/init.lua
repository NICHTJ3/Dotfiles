return {
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        init = function()
            require "plugins.theme.startup"
        end,
    }, -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = true,
    }, -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
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
