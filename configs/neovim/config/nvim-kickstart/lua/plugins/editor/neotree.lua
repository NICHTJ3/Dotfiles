return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = {
    'Neotree',
  },
  keys = {
    { '<leader>sF', '<cmd>Neotree<cr>', desc = '[S]how [F]ile explorer' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    window = {
      position = 'right',
    },
  },
}
