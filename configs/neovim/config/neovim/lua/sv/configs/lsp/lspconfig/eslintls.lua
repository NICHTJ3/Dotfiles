local M = {}

local function get_cmd(cmd)
    local lspconfig = require('lspconfig')

    local buffer_location = vim.api.nvim_buf_get_name(0)

    local pnpm = lspconfig.util.root_pattern('pnpm-lock.yml', 'pnpm-lock.yaml')(
        buffer_location)

    local yarn = lspconfig.util
        .root_pattern('.pnp.cjs', '.pnp.js')(
            buffer_location)


    local new_cmd = cmd
    if pnpm and vim.fn.executable('pnpm') == 1 then
        new_cmd = { "pnpm", "exec", unpack(cmd) }
    end

    if yarn and vim.fn.executable('yarn') == 1 then
        new_cmd = { "yarn", "exec", unpack(cmd) }
    end

    return new_cmd
end

local eslint_config = require("lspconfig.server_configurations.eslint")
local cmd = eslint_config.default_config.cmd

M.config = {
    on_new_config = function(config, new_root_dir)
        eslint_config.default_config.on_new_config(config, new_root_dir)
        config.cmd = get_cmd(cmd)
    end
}
M.get_cmd = get_cmd

return M
