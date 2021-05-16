if require('personal.first_load')() then return end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("personal.plugins")

vim.lsp.set_log_level("debug")

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
