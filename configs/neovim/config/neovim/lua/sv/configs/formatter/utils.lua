local Check_command_installed = function(command)
    if os.execute('! which ' .. command .. ' &> /dev/null') == 0 then
        print("You must install " .. command)
        return false
    end
    return true
end

local prettierd = function()
    if not Check_command_installed('prettier_d_slim') then return end
    local filename = vim.api.nvim_buf_get_name(0):gsub("([%[%]])", "%\\%1") -- escape only characters from set
    return {
        exe = "prettier_d_slim",
        args = {"--stdin-filepath " .. filename,"--stdin"},
        stdin = true
    }
end

local rustfmt = function()
    if not Check_command_installed('rustfmt') then return end
    return {exe = "rustfmt", stdin = true}
end

local gofmt = function()
    if not Check_command_installed('gofumpt') then return end
    return {exe = "gofumpt", stdin = true}
end

-- TODO: Better options for this
local luaformat = function()
    if not Check_command_installed('lua-format') then return end
    return {exe = "lua-format -i --align-parameter --align-args", stdin = true}
end

local formattable_file_types = {
    javascript = {prettierd},
    javascriptreact = {prettierd},
    ['javascript.tsx'] = {prettierd},
    typescript = {prettierd},
    typescriptreact = {prettierd},
    ['typescript.tsx'] = {prettierd},
    css = {prettierd},
    scss = {prettierd},
    go = {gofmt},
    html = {prettierd},
    json = {prettierd},
    jsonc = {prettierd},
    lua = {luaformat},
    markdown = {prettierd},
    php = {prettierd},
    rust = {rustfmt},
    svelte = {prettierd},
    yaml = {prettierd}
}

local M = {}

M.formattable_file_types = formattable_file_types
M.Check_command_installed = Check_command_installed

return M
