vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

return {
  'stevearc/oil.nvim',
  opts = {
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
