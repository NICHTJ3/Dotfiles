local shell_cache = {}

local Is_available_through_shell = function(command)
    if shell_cache[command] then return shell_cache[command] end

    if os.execute('which ' .. command) == 0 then
        shell_cache[command] = true
    else
        shell_cache[command] = false
    end
    return shell_cache[command]
end

local yarn_cache = {}

local Is_yarn_command = function(command)
    if yarn_cache[command] then return yarn_cache[command] end

    if Is_available_through_shell('yarn') and os.execute('yarn info ' .. command) == 0 then
        yarn_cache[command] = true
    else
        yarn_cache[command] = false
    end
    return yarn_cache[command]
end

local Command_installed = function(command)
    if Is_available_through_shell(command) or Is_yarn_command(command) then return true end
    vim.notify("You must install " .. command)
    return false
end

local shfmt = function()
    if not Command_installed('shfmt') then return end
    return { exe = "shfmt", stdin = true }
end

local prettierd = function()
    if not Command_installed('prettier') then return end

    local filename = vim.api.nvim_buf_get_name(0):gsub("([%[%]])", "%\\%1") -- escape only characters from set
    if Is_yarn_command('prettier') then
        return {
            exe = "yarn",
            args = { "--silent", "prettier", "--stdin-filepath", filename },
            stdin = true
        }
    end
    if Is_available_through_shell('prettier') then
        return {
            exe = "prettier",
            args = { "--stdin-filepath", filename },
            stdin = true
        }
    end
end

local rustfmt = function()
    if not Command_installed('rustfmt') then return end
    return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
end

local gofmt = function()
    if not Command_installed('gofmt') then return end
    return { exe = "gofmt", stdin = true }
end

-- TODO: Better options for this
local luaformat = function()
    if not Command_installed('lua-format') then return end
    return {
        exe = "lua-format",
        args = { "-i", "--align-parameter", "--align-args" },
        stdin = true
    }
end

local terraform = function()
    if not Command_installed('terraform') then return end
    return { exe = "terraform", args = { "fmt", "-" }, stdin = true }
end

local formattable_file_types = {
    javascript = { prettierd },
    javascriptreact = { prettierd },
    ['javascript.tsx'] = { prettierd },
    typescript = { prettierd },
    typescriptreact = { prettierd },
    ['typescript.tsx'] = { prettierd },
    css = { prettierd },
    scss = { prettierd },
    go = { gofmt },
    html = { prettierd },
    json = { prettierd },
    jsonc = { prettierd },
    lua = { luaformat },
    markdown = { prettierd },
    php = { prettierd },
    rust = { rustfmt },
    svelte = { prettierd },
    yaml = { prettierd },
    terraform = { terraform },
    bash = { shfmt },
    sh = { shfmt },
    [''] = {}
}

local M = {}

M.formattable_file_types = formattable_file_types
M.Check_command_installed = Command_installed

return M
