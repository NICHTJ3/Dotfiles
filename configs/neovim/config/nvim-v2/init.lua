vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


require('valhalla')

-- After config
vim.lsp.set_log_level("debug")

-- Global varaibles for unpacking tables and reloading modules
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
