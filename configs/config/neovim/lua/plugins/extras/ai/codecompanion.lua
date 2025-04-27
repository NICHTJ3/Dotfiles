return {
  'olimorris/codecompanion.nvim',
  event = 'VeryLazy',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      optional = true,
      opts = {
        file_types = { 'codecompanion' },
      },
      ft = { 'codecompanion' },
    },
  },
}
