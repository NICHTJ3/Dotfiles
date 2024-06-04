-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

  -- NOTE: I might want to add this back in, but for now the editorconfig used in one of my main projects causes some issues with trailing new lines
  -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Automatically set the bg color of your terminal to match your theme
  { 'typicode/bg.nvim', lazy = false },

  -- You can require themes you want to use here too
  -- require 'themes.tokyodark',

  { import = 'plugins' },
}, {
  {
    -- automatically check for config file changes and reload the ui
    change_detection = {
      enabled = true,
      notify = false, -- get a notification when changes are found
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
