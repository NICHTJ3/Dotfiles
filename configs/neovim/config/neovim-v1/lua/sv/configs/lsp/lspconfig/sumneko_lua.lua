local servers = require "nvim-lsp-installer.servers"

local M = {}

M.config = {
    settings = {
        Lua = {
            runtime = {version = 'Lua 5.1'},
            diagnostics = {globals = {'vim'}}
        }
    }
}

return M
