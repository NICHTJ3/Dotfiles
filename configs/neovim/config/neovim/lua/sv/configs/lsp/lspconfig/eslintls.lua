local path = require "nvim-lsp-installer.path"
local server = require "nvim-lsp-installer.server"
local root_dir = server.get_server_root_path('eslint')
local common_on_attach = require('sv.configs.lsp').common_on_attach

local M = {}

M.config = {
    cmd = {
        "yarn", 'node',
        path.concat {root_dir, "server", "out", "eslintServer.js"}, "--stdio"
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
        common_on_attach(client, bufnr)
    end,
    settings = {format = {enable = true}}

}

return M
