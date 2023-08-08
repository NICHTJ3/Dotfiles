return {
    "folke/edgy.nvim",
    dependencies = { { "akinsho/toggleterm.nvim", version = "*", config = true } },
    event = "VeryLazy",
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
    opts = {
        bottom = { -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
            {
                ft = "toggleterm",
                size = {
                    height = 0.2,
                },
                -- exclude floating windows
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
            },
            "Trouble",
            {
                ft = "qf",
                title = "QuickFix",
            },
            {
                ft = "help",
                size = {
                    height = 20,
                },
                -- only show help buffers
                filter = function(buf)
                    ---@diagnostic disable-next-line: undefined-field
                    return vim.bo[buf].buftype == "help"
                end,
            },
        },
        right = { -- Neo-tree filesystem always takes half the screen height
            -- {
            --     title = "Neo-Tree files",
            --     ft = "neo-tree",
            --     size = {
            --         height = 0.5,
            --     },
            --     filter = function(buf)
            --         return vim.b[buf].neo_tree_source == "filesystem"
            --     end,
            --     pinned = true,
            --     open = "Neotree position=bottom filesystem",
            -- },
            -- {
            --     title = "Neo-Tree Diagnostics",
            --     ft = "neo-tree",
            --     filter = function(buf)
            --         return vim.b[buf].neo_tree_source == "diagnostics"
            --     end,
            --     pinned = true,
            --     open = "Neotree position=left diagnostics",
            -- },
            -- {
            --     title = "Neo-Tree Buffers",
            --     ft = "neo-tree",
            --     filter = function(buf)
            --         return vim.b[buf].neo_tree_source == "buffers"
            --     end,
            --     pinned = true,
            --     open = "Neotree position=top buffers",
            -- },
            -- {
            --     title = "Neo-Tree Git",
            --     ft = "neo-tree",
            --     filter = function(buf)
            --         return vim.b[buf].neo_tree_source == "git_status"
            --     end,
            --     pinned = true,
            --     open = "Neotree position=right git_status",
            -- },
            "neo-tree",
        },
    },
}
