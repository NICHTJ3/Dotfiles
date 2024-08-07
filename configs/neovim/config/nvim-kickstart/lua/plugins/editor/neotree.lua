return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = {
    'Neotree',
  },
  keys = {
    { '<leader>ts', '<cmd>Neotree toggle<cr>', desc = '[T]oggle [S]idebar' },
    { '<leader>sF', '<cmd>Neotree toggle<cr>', desc = '[S]how [F]ile explorer' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    filesystem = {
      follow_current_file = { enabled = true },
    },
    window = {
      position = 'right',
    },
  },
}
