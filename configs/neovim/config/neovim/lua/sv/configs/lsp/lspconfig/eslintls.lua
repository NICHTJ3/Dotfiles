local eslint_config = require("lspconfig.server_configurations.eslint")

local M = {}

local cmd = eslint_config.default_config.cmd

if vim.fn.executable('yarn') == 1 then
    -- If we have yarn installed execute the lsp wrapped with yarn exec to
    -- avoid issues resolving modules in yarn 2 repo's
    cmd = vim.list_extend({"yarn", "exec"}, cmd)
end

M.config = {cmd = cmd}

return M
