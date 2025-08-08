return {
  'CopilotC-Nvim/CopilotChat.nvim',
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim', branch = 'master' },
  },
  keys = {
    { '<leader>a', mode = { 'n', 'v' }, '', desc = '+[A]I' },
    { '<leader>ac', '<cmd>CopilotChatToggle<cr>', desc = '[A]I [C]hat toggle' },
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
            vim.cmd('CopilotChat ' .. input)
          else
            vim.notify 'CopilotChat: No input provided'
          end
        end)
      end,
      desc = '[A]I [I]nline',
    },
    { '<leader>at', mode = { 'v' }, '<cmd>CopilotChatTests<cr>', desc = '[A]I [T]est' },
    { '<leader>aa', mode = { 'n', 'v' }, '<cmd>CopilotChatPrompts<cr>', desc = '[A]I [A]ction' },
  },
  opts = {},
}
