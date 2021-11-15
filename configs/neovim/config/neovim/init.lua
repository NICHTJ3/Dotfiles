if require('sv.first_load')() then return end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("sv.plugins")
require("personal.mappings.leader")

vim.lsp.set_log_level("error")

P = function(v)
    print(vim.inspect(v))
    return v
end

if pcall(require, 'plenary') then
    RELOAD = require('plenary.reload').reload_module

    R = function(name)
        RELOAD(name)
        return require(name)
    end
end
