return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = { theme = "auto", globalstatus = true },
    },
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
}
