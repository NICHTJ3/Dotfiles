local eslint_config = require("lspconfig.server_configurations.eslint")
local lspconfig = require('lspconfig')

local M = {}

local function get_cmd()

    local cmd = eslint_config.default_config.cmd

    local buffer_location = vim.api.nvim_buf_get_name(0)

    local pnpm = lspconfig.util.root_pattern('pnpm-lock.yml', 'pnpm-lock.yaml')(
                     buffer_location)

    local yarn2 = lspconfig.util.root_pattern('.pnp.cjs', '.pnp.js')(
                      buffer_location)

    if pnpm and vim.fn.executable('pnpm') == 1 then
        cmd =
            vim.list_extend({"pnpm", "exec"}, eslint_config.default_config.cmd)
    end
    --
    if yarn2 and vim.fn.executable('yarn') == 1 then
        cmd =
            vim.list_extend({"yarn", "exec"}, eslint_config.default_config.cmd)
    end
    return cmd
end

M.config = {on_new_config = function(config) config.cmd = get_cmd() end}

return M
