return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    branch = "v2.x",
    dependencies = {
        {
            "simrat39/symbols-outline.nvim",
            module = "neo-tree.sources.symbols-outline",
        },
        {
            "mrbjarksen/neo-tree-diagnostics.nvim",
            module = "neo-tree.sources.diagnostics",
        },
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            -- only needed if you want to use the commands with "_with_window_picker" suffix
            "s1n7ax/nvim-window-picker",
            version = "v1.*",
            opts = {
                autoselect_one = true,
                include_current = false,
                filter_rules = {
                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { "terminal" },
                    },
                },
                other_win_hl_color = "#e35e4f",
            },
        },
    },
    config = function()
        local neotree = require "plugins.neotree.config"
        neotree.setup()
        neotree.keymaps()
    end,
}
