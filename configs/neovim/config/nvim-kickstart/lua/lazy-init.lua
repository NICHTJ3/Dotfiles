-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  {
    -- NOTE: I might want to enable this for all file types, but for now the editorconfig is used in one of my main projects causes some issues with trailing new lines
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    event = 'VeryLazy',
    ft = { 'lua', 'yaml', 'json', 'bash', 'zsh' },
    cmds = { 'Sleuth' },
  },

  -- Automatically set the bg color of your terminal to match your theme
  { 'typicode/bg.nvim', lazy = false },

  -- You can require themes you want to use here too
  -- require 'themes.tokyodark',
  --

  { import = 'plugins' },
  { import = 'plugins/ui' },
  { import = 'plugins/lsp' },
  { import = 'plugins/trial' }, -- Plugins I'm trialling
  { import = 'plugins/editor' },
  { import = 'plugins/extras' },
}, {
  -- automatically check for config file changes and reload the ui
  defaults = { lazy = true },
  change_detection = {
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  install = { colorscheme = { 'tokyonight', 'habamax' } },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        -- "netrwPlugin",
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
