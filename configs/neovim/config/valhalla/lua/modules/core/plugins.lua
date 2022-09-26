local plugin = require("core.pack").register_plugin

plugin { "lewis6991/impatient.nvim" }

-- ======= Personal must have ========
plugin {
    "ten3roberts/qf.nvim", -- Alternative to "romainl/vim-qf"
    config = function()
        require("qf").setup {}

        -- Quickfix/Location list navigation
        vim.keymap.set("n", "<Down>", function()
            require("qf").below "visible"
        end, { noremap = true })
        vim.keymap.set("n", "<Up>", function()
            require("qf").above "visible"
        end, { noremap = true })

        -- Show quickfix
        vim.keymap.set("n", "<leader>sq", function()
            require("qf").toggle("c", true)
        end, { noremap = true })
        -- Show location
        vim.keymap.set("n", "<leader>sl", function()
            require("qf").toggle("l", true)
        end, { noremap = true })
    end,
}

plugin "wincent/loupe" -- Better search use this or evanesco
plugin {
    "unblevable/quick-scope",
    config = function()
        vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
    end,
}

-- ======= TPOPE =========
plugin "tpope/vim-repeat" -- Repeat with . sequences that use pluggins
plugin "tpope/vim-sleuth" -- Automatically detect indentation
plugin "tpope/vim-surround" -- Change/Add surrounding character


