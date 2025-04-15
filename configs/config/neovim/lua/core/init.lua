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

local M = {}

--- @alias Colorscheme 'onedark' | 'onedark_vivid' | 'onelight' |'onedark_dark' | 'blue' | 'cyberdream' | 'darkblue' | 'default' | 'delek' | 'desert' | 'elflord' | 'evening' | 'habamax' | 'industry' | 'kanagawa' | 'kanagawa-dragon' | 'kanagawa-lotus' | 'kanagawa-wave' | 'koehler' | 'lunaperche' | 'morning' | 'murphy' | 'pablo' | 'peachpuff' | 'quiet' | 'retrobox' | 'ron' | 'shine' | 'slate' | 'sorbet' | 'tokyonight' | 'tokyonight-day' | 'tokyonight-moon' | 'tokyonight-night' | 'tokyonight-storm' | 'torte' | 'vim' | 'wildcharm' | 'zaibatsu' | 'zellner' | 'catppuccin'|'catppuccin-latte'|'catppuccin-mocha'| 'catppuccin-frappe'| 'catppuccin-macchiato'

---@param opts {colorscheme: Colorscheme | string}
function M.setup(opts)
  _G.Core = require 'core.util'

  -- Register the LazyFile event
  Core.events.add_lazy_file_event()

  -- Setup lazy.nvim
  require('lazy').setup {
    spec = {
      { 'folke/lazy.nvim', version = '*' },
      -- Automatically set the bg color of your terminal to match your theme
      { 'nichtj3/bg.nvim', lazy = false },
      -- import your plugins
      { import = 'plugins' },
      { import = 'plugins.extras.ai' },
      { import = 'plugins.extras.coding.octo' },
      { import = 'plugins.extras.formatters.prettier' },
      { import = 'plugins.extras.linters.eslint' },
      { import = 'plugins.extras.filenavigation.harpoon' },
      { import = 'plugins.extras.lang.git' },
      { import = 'plugins.extras.lang.json' },
      -- { import = 'plugins.extras.lang.omnisharp' }, -- Omnisharp seems to be a little slower in large projects however the go to definition is a lot more reliable
      { import = 'plugins.extras.lang.csharpls' },
      { import = 'plugins.extras.lang.prisma' },
      { import = 'plugins.extras.lang.rust' },
      { import = 'plugins.extras.lang.typescript' },
      { import = 'plugins.extras.lang.terraform' },
      { import = 'plugins.extras.lang.markdown' },
      { import = 'plugins.extras.lang.docker' },
      { import = 'plugins.extras.lang.css' },
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
