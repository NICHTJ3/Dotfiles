local get_cmd = require('sv.configs.lsp.lspconfig.utils').get_cmd
local eslint_config = require("lspconfig.server_configurations.eslint")

local cmd = eslint_config.default_config.cmd

local M = {}

M.config = {
    on_new_config = function(config, new_root_dir)
        eslint_config.default_config.on_new_config(config, new_root_dir)
        config.cmd = get_cmd(cmd)
    end
}

return M
