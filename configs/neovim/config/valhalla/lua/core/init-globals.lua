-- Print helper
function P(...)
    local args = { n = select("#", ...), ... }
    for i = 1, args.n do
        args[i] = vim.inspect(args[i])
    end
    print(unpack(args))
end

-- Reload helper
if pcall(require, "plenary") then
    RELOAD = require("plenary.reload").reload_module

    R = function(name)
        RELOAD(name)
        return require(name)
    end
end
