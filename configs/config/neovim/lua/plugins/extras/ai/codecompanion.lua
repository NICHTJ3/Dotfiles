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
    {
      '<leader>ai',
      mode = { 'v' },
      function()
        local user_input = vim.fn.input '[AI]: What would you like help with? '

        if user_input and user_input ~= '' then
          vim.cmd('CodeCompanion ' .. user_input)
        else
          print 'No input provided'
        end
      end,
      desc = '[A]I [I]nline',
    },
    { '<leader>ae', mode = { 'n', 'v' }, '<cmd>CodeCompanion /explain<cr>', desc = '[A]I [E]xplain' },
    { '<leader>ac', mode = { 'n', 'v' }, '<cmd>CodeCompanionChat Toggle<cr>', desc = '[A]I [C]hat toggle' },
    { '<leader>aC', mode = { 'n', 'v' }, '<cmd>CodeCompanionChat<cr>', desc = '[A]I [C]reate a new chat' },
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
