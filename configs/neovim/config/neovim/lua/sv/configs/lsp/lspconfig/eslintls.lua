local M = {}

local function get_cmd()
    local lspconfig = require('lspconfig')
    local eslint_config = require("lspconfig.server_configurations.eslint")

    local cmd = eslint_config.default_config.cmd

    local buffer_location = vim.api.nvim_buf_get_name(0)

    local pnpm = lspconfig.util.root_pattern('pnpm-lock.yml', 'pnpm-lock.yaml')(
                     buffer_location)

    local yarn2 = lspconfig.util.root_pattern('.pnp.cjs', '.pnp.js')(
                      buffer_location)

    local lsp_cmd = eslint_config.default_config.cmd[1]
    local cmd_args = {unpack(eslint_config.default_config.cmd, 2)}

    if pnpm and vim.fn.executable('pnpm') == 1 then
        cmd = {"pnpm", "exec", cmd, "--", unpack(cmd_args)}
    end
    --
    if yarn2 and vim.fn.executable('yarn') == 1 then
        cmd = {"yarn", "exec", lsp_cmd, "--", unpack(cmd_args)}
    end
    return cmd
end

M.config = {
    cmd = get_cmd(),
    on_new_config = function(config) config.cmd = get_cmd() end
}

return M
