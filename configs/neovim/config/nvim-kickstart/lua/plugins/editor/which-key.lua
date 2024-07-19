return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function() -- This is the function that runs, AFTER loading
      local wk = require 'which-key'

      wk.setup()

      -- Document existing key chains
      wk.add {
        { '<leader>l', desc = '[L]sp' },
        { '<leader>c', desc = '[C]ode' },
        { '<leader>s', desc = '[S]earch' },
        { '<leader>t', desc = '[T]oggle' },
        {
          '<leader>h',
          group = 'Git [H]unk',
          mode = { 'v', 'n' },
        },
      }

      wk.add {
        { '<leader>w', group = '[W]indow' },
        { '<leader>wa', group = '[A]dd', mode = 'n' },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
