return {
  'voldikss/vim-browser-search',
  config = function()
    vim.keymap.set('n', 'gs', '<Plug>SearchNormal', { desc = '[G]oogle [S]earch' })
    vim.keymap.set('v', 'gs', '<Plug>SearchVisual', { desc = '[G]oogle [S]earch' })
  end,
}
