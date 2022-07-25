vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.nvcode_termcolors = 256
vim.o.termguicolors = true

function P(...)
    local args = { n = select("#", ...), ... }
    for i = 1, args.n do
        args[i] = vim.inspect(args[i])
    end
    print(unpack(args))
end

if not pcall(require, "impatient") then
    print "Failed to load impatient."
end

if pcall(require, "plenary") then
    RELOAD = require("plenary.reload").reload_module

    R = function(name)
        RELOAD(name)
        return require(name)
    end
end

require "valhalla.first-start"
require "valhalla.plugins"
require "valhalla.theme"
require "personal"
