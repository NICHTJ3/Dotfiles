-- Set <space> as the leader key and \ as the local leader
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('core').setup {
  colorscheme = 'retrobox',
}

-- Set personal options
require 'options'
-- Set personal keymaps
require 'keymaps'
