return {
  {
    'folke/snacks.nvim',
    opts = {
      explorer = { enabled = true },
    },
    keys = {
      {
        '<leader>us',
        function()
          Snacks.explorer.open()
        end,
        desc = '[U]I Toggle [S]idebar',
      },
      {
        '<leader>sF',

        function()
          Snacks.explorer.open()
        end,
        desc = '[S]how [F]ile explorer',
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = false,
  },
}
