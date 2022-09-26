local plugin = require("core.pack").register_plugin

plugin {
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "cwebster2/github-coauthors.nvim",
        "nvim-telescope/telescope-project.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
        local telescope = require "modules.telescope.config"
        telescope.setup()
        telescope.keymaps()
    end,
}
