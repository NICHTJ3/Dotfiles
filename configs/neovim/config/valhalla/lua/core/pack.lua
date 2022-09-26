local load_module_files = require("core.utils.dynamic-load").load_module_files

local packer = nil

local data_dir = string.format("%s/site/", vim.fn.stdpath "data")
local packer_compiled = data_dir .. "lua/packer_compiled.lua"

local Packer = {}

Packer.__index = Packer

function Packer:load_module_plugins()
    self.repos = {}
    load_module_files "plugins.lua"
end

function Packer:load_packer()
    if not packer then
        vim.api.nvim_command "packadd packer.nvim"
        packer = require "packer"
    end
    packer.init {
        compile_path = packer_compiled,
        git = { clone_timeout = 120 },
        disable_commands = true,
        display = {
            open_fn = require("packer.util").float,
            working_sym = "ﰭ",
            error_sym = "",
            done_sym = "",
            removed_sym = "",
            moved_sym = "ﰳ",
        },
    }
    packer.reset()
    local use = packer.use
    self:load_module_plugins()
    use { "wbthomason/packer.nvim", opt = true }
    for _, repo in ipairs(self.repos) do
        use(repo)
    end
end

function Packer:ensure_plugins_installed()
    local packer_dir = data_dir .. "pack/packer/opt/packer.nvim"
    local state = vim.loop.fs_stat(packer_dir)
    if not state then
        local cmd = "!git clone https://github.com/wbthomason/packer.nvim " .. packer_dir
        vim.api.nvim_command(cmd)
        vim.loop.fs_mkdir(data_dir .. "lua", 511, function()
            assert "make compile path dir failed"
        end)
        self:load_packer()
        packer.sync()
    end
end

local module = setmetatable({}, {
    __index = function(_, key)
        if not packer then
            Packer:load_packer()
        end
        return packer[key]
    end,
})

function module.ensure_plugins_installed()
    Packer:ensure_plugins_installed()
end

function module.register_plugin(repo)
    table.insert(Packer.repos, repo)
end

function module.load_installed_plugins()
    if vim.fn.filereadable(packer_compiled) == 1 then
        require "packer_compiled"
    else
        vim.notify("Run PackerSync or PackerCompile", "info", { title = "Packer" })
    end

    local cmds = {
        "Compile",
        "Install",
        "Update",
        "Sync",
        "Clean",
        "Status",
    }

    for _, cmd in ipairs(cmds) do
        vim.api.nvim_create_user_command("Packer" .. cmd, function()
            require("core.pack")[vim.fn.tolower(cmd)]()
        end, {})
    end

    local PackerHooks = vim.api.nvim_create_augroup("PackerHooks", {})
    vim.api.nvim_create_autocmd("User", {
        pattern = "PackerCompileDone",
        callback = function()
            vim.notify("Compile Done!", vim.log.levels.INFO, { title = "Packer" })
        end,
        group = PackerHooks,
    })
end

return module
