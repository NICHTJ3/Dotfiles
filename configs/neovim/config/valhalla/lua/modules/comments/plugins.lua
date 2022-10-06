local plugin = require("core.pack").register_plugin

-- ========= Better commenting ===========
plugin {
    "numToStr/Comment.nvim",
    config = function()
        require("modules.comments.config").setup()
    end,
}

plugin {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end,
}
