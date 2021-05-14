require("personal.plugins.telescope")
require("personal.plugins.nvim-treesitter")
require("personal.plugins.lua-line")
require("personal.plugins.todo-comments")

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
