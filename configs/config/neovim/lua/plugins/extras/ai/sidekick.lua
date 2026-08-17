local PREFERRED_CLI_AGENTS = {
  { cmd = 'claude', name = 'claude' },
  { cmd = 'cursor-agent', name = 'cursor' },
  { cmd = 'opencode', name = 'opencode' },
  { cmd = 'gemini', name = 'gemini' },
  { cmd = 'copilot', name = 'copilot' },
}

local function default_cli_agent()
  for _, agent in ipairs(PREFERRED_CLI_AGENTS) do
    if vim.fn.executable(agent.cmd) == 1 then
      return agent.name
    end
  end
  return nil
end

return {
  {
    'folke/sidekick.nvim',
    version = '*',
    lazy = false,
    opts = {
      cli = {
        mux = {
          enabled = true,
        },
        win = {
          layout = 'float',
          float = { border = 'rounded' },
          keys = {
            shift_enter = {
              '<S-CR>',
              function(terminal)
                -- Send keyboard protocol shift+enter directly to the job
                vim.api.nvim_chan_send(terminal.job, '\x1b\r')
              end,
              mode = 't',
              desc = 'send shift+enter to terminal',
            },
          },
        },
      },
    },
    keys = {
      { '<leader>a', '', desc = '+[A]i', mode = { 'n', 'v' } },
      {
        '<leader>ac',
        function()
          require('sidekick.cli').toggle {
            focus = true,
            name = default_cli_agent(),
          }
        end,
        desc = '[A]I [c]hat toggle',
        mode = { 'n', 'v', 't' },
      },
      {
        '<c-;>',
        function()
          require('sidekick.cli').toggle {
            focus = true,
            name = default_cli_agent(),
          }
        end,
        desc = '[A]I chat toggle',
        mode = { 'n', 'v', 't' },
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
