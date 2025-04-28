-- Set <space> as the leader key and \ as the local leader
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('core.init').setup {
  colorscheme = 'catppuccin-macchiato',
  extras = {
    { import = 'plugins.extras.ai.avante' },
    { import = 'plugins.extras.ai.copilot' },
    { import = 'plugins.extras.coding.octo' },
    { import = 'plugins.extras.formatters.prettier' },
    { import = 'plugins.extras.linters.eslint' },
    { import = 'plugins.extras.filenavigation.harpoon' },
    { import = 'plugins.extras.lang.git' },
    { import = 'plugins.extras.lang.json' },
    { import = 'plugins.extras.lang.csharpls' },
    { import = 'plugins.extras.lang.prisma' },
    { import = 'plugins.extras.lang.rust' },
    { import = 'plugins.extras.lang.typescript' },
    { import = 'plugins.extras.lang.terraform' },
    { import = 'plugins.extras.lang.markdown' },
    { import = 'plugins.extras.lang.docker' },
    { import = 'plugins.extras.lang.css' },
  },
}

-- Set personal options
require 'options'
-- Set personal keymaps
require 'keymaps'
