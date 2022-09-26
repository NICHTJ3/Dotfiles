local vim_path = vim.fn.stdpath "config"
local modules_dir = vim_path .. "/lua/modules"

local get_files_to_load = function(filename)
    local list = {}
    local tmp = vim.split(vim.fn.globpath(modules_dir, "*/" .. filename), "\n")
    for _, f in ipairs(tmp) do
        list[#list + 1] = string.match(f, "lua/(.+).lua$")
    end
    return list
end

local module = {}

module.get_files_to_load = get_files_to_load

function module.load_module_files(file_to_load, skip_init_files)
    local files_to_load = get_files_to_load(file_to_load)
    for _, m in ipairs(files_to_load) do
        if not skip_init_files or not m:match "/init$" then
            require(m)
        end
    end
end

return module
