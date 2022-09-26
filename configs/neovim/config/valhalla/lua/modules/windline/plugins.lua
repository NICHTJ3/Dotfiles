local plugin = require("core.pack").register_plugin

plugin {
    "windwp/windline.nvim", -- Status line
    config = function()
        vim.o.laststatus = 3
        require("modules.windline.config").setup()
    end,
}
