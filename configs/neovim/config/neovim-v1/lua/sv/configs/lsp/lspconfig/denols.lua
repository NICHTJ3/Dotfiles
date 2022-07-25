local util = require 'lspconfig.util'

local M = {}

M.config = {
    init_options = {
        config = './deno.jsonc',
        lint = true,
    },
    root_dir = require("lspconfig").util.root_pattern("mod.ts", ".deno.jsonc"),
}

return M
