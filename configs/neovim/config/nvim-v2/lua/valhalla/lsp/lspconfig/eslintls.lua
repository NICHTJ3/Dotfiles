local servers = require "nvim-lsp-installer.servers"

local M = {}

local _, server = servers.get_server('eslint')
local default_opts = server._default_options
local cmd = default_opts.cmd

-- If we have yarn installed execute the lsp wrapped with yarn node to
-- avoid issues resolving modules in yarn 2 repo's
if vim.fn.executable('yarn') == 1 then
    cmd = vim.list_extend({"yarn", "node"}, default_opts.cmd)
end

M.config = {cmd = cmd}

return M
