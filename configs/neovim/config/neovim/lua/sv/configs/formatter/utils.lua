local prettier = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

local rustfmt = function()
    return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
end

local gofmt = function() return {exe = "gofumpt", stdin = true} end

-- TODO: Better options for this
local luaformat = function()
    return {exe = "lua-format -i --align-parameter --align-args", stdin = true}
end

local formattable_file_types = {
    typescriptreact = {prettier},
    javascript = {prettier},
    typescript = {prettier},
    svelte = {prettier},
    css = {prettier},
    jsonc = {prettier},
    json = {prettier},
    html = {prettier},
    php = {prettier},
    rust = {rustfmt},
    go = {gofmt},
    lua = {luaformat},
    yaml = {prettier}
}

local M = {}

M.formattable_file_types = formattable_file_types

return M
