return {
  'folke/sidekick.nvim',
  lazy = false,
  opts = {},
  keys = {
    { '<leader>a', mode = { 'n', 'v' }, '', desc = '+[A]I' },
    {
      '<leader>aa',
      function()
        require('sidekick.cli').select_prompt()
      end,
      desc = '[A]I [A]ction',
      mode = { 'n', 'v' },
    },
    {
      '<leader>ac',
      function()
        require('sidekick.cli').ask { prompt = 'file', name = 'copilot' }
      end,
      desc = '[A]I [C]hat',
      mode = { 'n' },
    },
    {
      '<leader>at',
      mode = { 'n' },
      function()
        require('sidekick.cli').ask { prompt = 'test', name = 'copilot' }
      end,
      desc = '[A]I [T]est',
    },
    {
      '<leader>ai',
      function()
        require('sidekick.cli').ask { name = 'copilot' }
      end,
      desc = '[A]I [I]nline',
      mode = { 'v' },
    },
    {
      '<leader>af',
      function()
        require('sidekick.cli').ask { prompt = 'fix', name = 'copilot' }
      end,
      desc = '[A]I [F]ix',
      mode = { 'n', 'v' },
    },
  },
}
