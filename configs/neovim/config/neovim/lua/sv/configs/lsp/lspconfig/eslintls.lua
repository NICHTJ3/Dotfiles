local npm = require "nvim-lsp-installer.installers.npm"
local server = require "nvim-lsp-installer.server"

local lsp_root_dir = server.get_server_root_path('vscode-langservers-extracted')
local executable = "vscode-eslint-language-server"

local M = {}

local function get_command()
    local cmd = npm.executable(lsp_root_dir, executable)

    -- If we have yarn installed execute the lsp wrapped with yarn node to
    -- avoid issues resolving modules in yarn 2 repo's
    if vim.fn.executable('yarn') == 1 then
        return {'yarn', 'node', cmd, '--stdio'}
    end
    return {cmd, '--stdio'}

end

M.config = {cmd = get_command()}

return M
