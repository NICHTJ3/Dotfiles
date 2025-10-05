return {
  {
    'folke/sidekick.nvim',
    lazy = false,
    opts = {
      cli = {
        mux = {
          enabled = true,
          backend = 'tmux',
        },
      },
    },
    keys = {
      { '<leader>a', mode = { 'n', 'v' }, '', desc = '+[A]I' },
      {
        '<leader>aa',
        function()
          require('sidekick.cli').prompt()
        end,
        desc = '[A]I [A]ction',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ac',
        function()
          require('sidekick.cli').send { prompt = 'file', name = 'copilot' }
        end,
        desc = '[A]I [C]hat',
        mode = { 'n' },
      },
      {
        '<leader>at',
        mode = { 'n' },
        function()
          require('sidekick.cli').send { prompt = 'test', name = 'copilot' }
        end,
        desc = '[A]I [T]est',
      },
      {
        '<leader>ai',
        function()
          require('sidekick.cli').send { name = 'copilot' }
        end,
        desc = '[A]I [I]nline',
        mode = { 'v' },
      },
      {
        '<leader>af',
        function()
          require('sidekick.cli').send { prompt = 'fix', name = 'copilot' }
        end,
        desc = '[A]I [F]ix',
        mode = { 'n', 'v' },
      },
      {
        '<c-_>',
        function()
          require('sidekick.cli').focus {
            name = 'copilot',
          }
        end,
        mode = { 'n', 'x', 'i', 't' },
        desc = 'Sidekick Switch Focus',
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = function(_, opts)
      opts.sections = opts.sections or {}
      opts.sections.lualine_c = opts.sections.lualine_c or {}
      table.insert(opts.sections.lualine_c, {
        function()
          return ' '
        end,
        color = function()
          local status = require('sidekick.status').get()
          if status then
            return status.kind == 'Error' and 'DiagnosticError' or status.busy and 'DiagnosticWarn' or 'Special'
          end
        end,
        cond = function()
          local status = require 'sidekick.status'
          return status.get() ~= nil
        end,
      })
    end,
  },
}
