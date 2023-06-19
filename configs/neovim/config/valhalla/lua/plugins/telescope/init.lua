return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "cwebster2/github-coauthors.nvim",
        "nvim-telescope/telescope-project.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
        local telescope = require "plugins.telescope.config"
        telescope.setup()
        telescope.keymaps()
    end,
}
