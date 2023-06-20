-- Load impatient to speed up startup
pcall(require, "impatient")

-- Initialize global helpers
require "core.init-globals"

-- Setup Lazy.nvim
require "core.lazy"

require "core.options"

require "core.mappings"
