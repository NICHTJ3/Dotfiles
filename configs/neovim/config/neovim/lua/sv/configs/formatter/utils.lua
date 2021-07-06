local check_command_installed = function(command)
    if os.execute('! which ' .. command .. ' &> /dev/null') == 0 then
        print("You must install " .. command)
        return false
    end
    return true
end

local prettierd = function()
    if check_command_installed('prettierd') then return end
    local filename = vim.api.nvim_buf_get_name(0):gsub("([%[%]])", "%\\%1") -- escape only characters from set
    return {exe = "prettierd", args = {filename}, stdin = true}
end

local rustfmt = function()
    if check_command_installed('rustfmt') then return end
    return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
end

local gofmt = function() return {exe = "gofumpt", stdin = true} end

-- TODO: Better options for this
local luaformat = function()
    if check_command_installed('lua-format') then return end
    return {exe = "lua-format -i --align-parameter --align-args", stdin = true}
end

local formattable_file_types = {
    typescriptreact = {prettierd},
    javascript = {prettierd},
    typescript = {prettierd},
    svelte = {prettierd},
    css = {prettierd},
    jsonc = {prettierd},
    json = {prettierd},
    html = {prettierd},
    php = {prettierd},
    rust = {rustfmt},
    go = {gofmt},
    lua = {luaformat},
    yaml = {prettierd}
}

local M = {}

M.formattable_file_types = formattable_file_types

return M
