return {
  'folke/trouble.nvim',
  branch = 'dev', -- Use the beta V3 branch
  keys = {
    {
      '<leader>tt',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>tQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
}
