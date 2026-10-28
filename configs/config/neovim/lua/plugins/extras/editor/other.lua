return {
  {
    'rgroli/other.nvim',
    event = 'VeryLazy',
    opts = {
      mappings = {
        'angular',
      },
    },
    config = function(_, opts)
      require('other-nvim').setup(opts)
    end,
    keys = {
      {
        '<M-o>',
        function()
          require('other-nvim').open()
        end,
        desc = 'Cycle related files',
      },
    },
  },
}
