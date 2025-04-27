return {
  'olimorris/codecompanion.nvim',
  event = 'VeryLazy',
  opts = {
    strategies = {
      chat = {
        keymaps = {
          close = {
            modes = {
              n = 'q',
            },
            index = 3,
            callback = 'keymaps.close',
            description = 'Close Chat',
          },
          stop = {
            modes = {
              n = '<C-c',
            },
            index = 4,
            callback = 'keymaps.stop',
            description = 'Stop Request',
          },
        },
      },
    },
  },
  keys = {
    { '<leader>a', mode = { 'n', 'v' }, '', desc = '+[A]I' },
    { '<leader>af', mode = { 'n', 'v' }, '<cmd>CodeCompanion /fix<cr>', desc = '[A]I [F]ix' },
    { '<leader>ae', mode = { 'n', 'v' }, '<cmd>CodeCompanion /explain<cr>', desc = '[A]I [E]xplain' },
    { '<leader>ac', mode = { 'n', 'v' }, '<cmd>CodeCompanionChat<cr>', desc = '[A]I [C]hat' },
    { '<leader>aa', mode = { 'n', 'v' }, '<cmd>CodeCompanionAction<cr>', desc = '[A]I [A]ction' },
  },
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
