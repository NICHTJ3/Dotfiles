local plugin = require("core.pack").register_plugin

-- Treesitter
if vim.fn.has "unix" == 1 then
    plugin {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "nvim-treesitter/playground", -- Debug treesitter
            "nvim-treesitter/nvim-treesitter-context", -- Show context at the top of the screen while scrolling
            "nvim-treesitter/nvim-treesitter-textobjects", -- Change inner function etc...
            "p00f/nvim-ts-rainbow", -- Rainbow brackets
            "JoosepAlviste/nvim-ts-context-commentstring", -- Better commenting in tsx/jsx
            "windwp/nvim-ts-autotag", -- Auto rename closing tags in html/jsx
        },
        config = function()
            require("modules.treesitter.config").setup()
        end,
    }
end
