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
        Snacks.input.input({
          prompt = '[AI] Inline: What would you like help with? ',
          win = {
            relative = 'cursor',
            row = -2,
            col = 0,
          },
        }, function(input)
          if input and input ~= '' then
            vim.cmd('CodeCompanion ' .. input)
          else
            vim.notify 'CodeCompanion: No input provided'
          end
        end)
      end,
      desc = '[A]I [I]nline',
    },
    { '<leader>at', mode = { 'v' }, '<cmd>CodeCompanion /tests<cr>', desc = '[A]I [T]est' },
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
