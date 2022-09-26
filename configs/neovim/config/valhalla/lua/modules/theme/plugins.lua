local plugin = require("core.pack").register_plugin

plugin "rebelot/kanagawa.nvim" -- Theme
plugin "folke/tokyonight.nvim" -- Theme
plugin {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        require("catppuccin").setup {
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            integrations = {
                neotree = {
                    enabled = true,
                    show_root = true,
                    transparent_panel = true,
                },
                ts_rainbow = true,
            },
        }
    end,
} -- Theme
plugin "navarasu/onedark.nvim" -- Theme
plugin "Yagua/nebulous.nvim" -- Theme
