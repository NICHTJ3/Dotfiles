return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  opts = {
    globalstatus = true,
  },
  config = function(opts)
    vim.o.laststatus = 3
    require('lualine').setup(opts)
  end,
}
