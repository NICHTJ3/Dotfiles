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
      { '<leader>a', '', desc = '+[A]i', mode = { 'n', 'v' } },
      {
        '<c-_>',
        function()
          require('sidekick.cli').toggle()
        end,
        desc = '[A]I chat toggle',
        mode = { 'n', 't', 'i', 'x' },
      },
      {
        '<leader>ac',
        function()
          require('sidekick.cli').toggle()
        end,
        desc = '[A]I chat toggle',
      },
      {
        '<leader>as',
        function()
          require('sidekick.cli').select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = '[A]I select tool',
      },
      {
        '<leader>ad',
        function()
          require('sidekick.cli').close()
        end,
        desc = '[A]I close',
      },
      {
        '<leader>at',
        function()
          require('sidekick.cli').send { msg = '{this}' }
        end,
        mode = { 'x', 'n' },
        desc = '[A]I send This',
      },
      {
        '<leader>af',
        function()
          require('sidekick.cli').send { msg = '{file}' }
        end,
        desc = '[A]I send File',
      },
      {
        '<leader>av',
        function()
          require('sidekick.cli').send { msg = '{selection}' }
        end,
        mode = { 'x' },
        desc = '[A]I send Selection',
      },
      {
        '<leader>aa',
        function()
          require('sidekick.cli').prompt()
        end,
        mode = { 'n', 'x' },
        desc = '[A]I action',
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
