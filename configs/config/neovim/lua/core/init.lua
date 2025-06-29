local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

table.unpack = table.unpack or unpack -- 5.1 compatibility

local M = {}

--- @alias Colorscheme 'onedark' | 'onedark_vivid' | 'onelight' |'onedark_dark' | 'blue' | 'cyberdream' | 'darkblue' | 'default' | 'delek' | 'desert' | 'elflord' | 'evening' | 'habamax' | 'industry' | 'kanagawa' | 'kanagawa-dragon' | 'kanagawa-lotus' | 'kanagawa-wave' | 'koehler' | 'lunaperche' | 'morning' | 'murphy' | 'pablo' | 'peachpuff' | 'quiet' | 'retrobox' | 'ron' | 'shine' | 'slate' | 'sorbet' | 'tokyonight' | 'tokyonight-day' | 'tokyonight-moon' | 'tokyonight-night' | 'tokyonight-storm' | 'torte' | 'vim' | 'wildcharm' | 'zaibatsu' | 'zellner' | 'catppuccin'|'catppuccin-latte'|'catppuccin-mocha'| 'catppuccin-frappe'| 'catppuccin-macchiato'| 'vercel'

---@param opts {colorscheme: Colorscheme | string, extras: LazySpec}
function M.setup(opts)
  _G.Core = require 'core.util'

  -- Register the LazyFile event
  Core.events.add_lazy_file_event()

  -- Setup lazy.nvim
  require('lazy').setup {
    spec = {
      { 'folke/lazy.nvim', version = '*' },
      { 'nichtj3/bg.nvim', event = 'ColorScheme' },
      -- Core plugins
      { import = 'plugins' },
      -- User extras
      table.unpack(opts.extras),
    },
    defaults = {
      lazy = true,
      version = false,
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { opts.colorscheme, 'retrobox' } },
    -- automatically check for plugin updates
    checker = { enabled = true },
    change_detection = {
      notify = false,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          'gzip',
          'matchit',
          'tarPlugin',
          'tohtml',
          'tutor',
          'zipPlugin',
        },
      },
    },
    profiling = {
      -- Enables extra stats on the debug tab related to the loader cache.
      -- Additionally gathers stats about all package.loaders
      loader = false,
      -- Track each new require in the Lazy profiling tab
      require = false,
    },
  }

  require 'core.autocmds'

  vim.cmd.colorscheme(opts.colorscheme)
end

return M
