-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Default theme
vim.o.background = 'dark'
vim.cmd.colorscheme 'retrobox'

require 'options'
require 'keymaps'
require 'lazy-init'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
