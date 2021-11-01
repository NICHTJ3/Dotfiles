local servers = require "nvim-lsp-installer.servers"

local M = {}

M.config = {settings = {Lua = {diagnostics = {globals = {'vim'}}}}}

return M
