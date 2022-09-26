-- Load impatient to speed up startup
pcall(require, "impatient")

local pack = require "core.pack"
local load_module_files = require("core.utils.dynamic-load").load_module_files

require "core.disable-builtins"

-- Initialize global helpers
require "core.init-globals"

pack.ensure_plugins_installed()

pack.load_installed_plugins()

require "core.options"

require "core.mappings"

load_module_files "startup.lua"
load_module_files("startup/*.lua", true)
