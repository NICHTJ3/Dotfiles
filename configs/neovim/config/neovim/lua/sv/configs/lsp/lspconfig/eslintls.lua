local path = require "nvim-lsp-installer.path"
local server = require "nvim-lsp-installer.server"
local root_dir = server.get_server_root_path('eslint')

local M = {}

M.config = {
    cmd = {
        "yarn", 'node',
        path.concat {root_dir, "server", "out", "eslintServer.js"}, "--stdio"
    }
}

return M
