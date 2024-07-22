-- Set <space> as the leader key and \ as the local leader
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Install and setup plugins
require 'core'

-- Set theme
vim.cmd.colorscheme 'retrobox'

-- Set personal vim options
require 'options'
-- Set personal vim keymaps
require 'keymaps'
