-- Load impatient to speed up startup
pcall(require, "impatient")

-- Initialize global helpers
require "core.init-globals"

require "core.options"

require "core.mappings"

-- Setup Lazy.nvim
require "core.lazy"
