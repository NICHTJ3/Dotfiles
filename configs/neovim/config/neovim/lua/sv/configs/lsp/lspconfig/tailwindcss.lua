local util = require 'lspconfig.util'

local M = {}

M.config = {
    root_dir = function(fname)
        return util.root_pattern('tailwind.config.js', 'tailwind.config.ts')(
                   fname)
    end
}

return M
