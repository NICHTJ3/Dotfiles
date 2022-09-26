local plugin = require("core.pack").register_plugin

-- ========= Better commenting ===========
plugin {
    "numToStr/Comment.nvim",
    config = function()
        require("modules.comments.config").setup()
    end,
}
