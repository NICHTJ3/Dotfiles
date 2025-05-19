-- Set <space> as the leader key and \ as the local leader
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('core.init').setup {
  colorscheme = 'catppuccin-macchiato',
  extras = {
    { import = 'plugins.extras.ai.avante' },
    { import = 'plugins.extras.ai.copilot' },
    { import = 'plugins.extras.ai.mcphub' },
    { import = 'plugins.extras.coding.octo' },
    { import = 'plugins.extras.editor.hardtime' },
    { import = 'plugins.extras.filenavigation.harpoon' },
    { import = 'plugins.extras.filenavigation.snacks-explorer' },
    { import = 'plugins.extras.formatters.prettier' },
    { import = 'plugins.extras.lang.css' },
    { import = 'plugins.extras.lang.docker' },
    { import = 'plugins.extras.lang.git' },
    { import = 'plugins.extras.lang.json' },
    { import = 'plugins.extras.lang.markdown' },
    { import = 'plugins.extras.lang.prisma' },
    { import = 'plugins.extras.lang.rest' },
    { import = 'plugins.extras.lang.rust' },
    { import = 'plugins.extras.lang.sql' },
    { import = 'plugins.extras.lang.terraform' },
    { import = 'plugins.extras.lang.typescript' },
    { import = 'plugins.extras.linters.eslint' },
    { import = 'plugins.extras.lang.csharp.roslyn',
    },
  },
}

-- Set personal options
require 'options'
-- Set personal keymaps
require 'keymaps'
