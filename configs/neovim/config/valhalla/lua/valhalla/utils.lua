local M = {}

M.get_cmd = function(cmd)
    local lspconfig = require "lspconfig"

    local buffer_location = vim.api.nvim_buf_get_name(0)

    local pnpm = lspconfig.util.root_pattern("pnpm-lock.yml", "pnpm-lock.yaml")(buffer_location)

    local yarn = lspconfig.util.root_pattern(".pnp.cjs", ".pnp.js")(buffer_location)

    local new_cmd = cmd
    if pnpm and vim.fn.executable "pnpm" == 1 then
        new_cmd = { "pnpm", "exec", unpack(cmd) }
    end

    if yarn and vim.fn.executable "yarn" == 1 then
        new_cmd = { "yarn", "exec", unpack(cmd) }
    end

    return new_cmd
end

return M
