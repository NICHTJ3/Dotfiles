local plugin = require("core.pack").register_plugin

plugin "tpope/vim-fugitive"
plugin "rhysd/committia.vim" -- Better commits
plugin {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
        local gitsigns_config = require "modules.git.config"
        gitsigns_config.setup()
    end,
}
