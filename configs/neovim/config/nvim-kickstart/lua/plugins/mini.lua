return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    keys = {
      'c',
      'y',
      'd',
      's',
    },
    dependencies = { { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'VeryLazy' } },
    config = function()
      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      require('mini.ai').setup {
        n_lines = 500,
        custom_textobjects = {
          F = spec_treesitter { a = '@function.outer', i = '@function.inner' },
          d = { '%f[%d]%d+' }, -- digits
          o = spec_treesitter {
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          },
        },
      }
      require('mini.surround').setup {
        mappings = {
          add = 'ys', -- Add surrounding in Normal and Visual modes. Carried over from the old surround.nvim plugin
          delete = 'ds', -- Delete surrounding
          find = 'sf', -- Find surrounding (to the right)
          find_left = 'sF', -- Find surrounding (to the left)
          highlight = 'sh', -- Highlight surrounding
          replace = 'cs', -- Change surrounding
          update_n_lines = 'sn', -- Update `n_lines`
          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
        -- Don't include spaces when wrapping text with parentheses
        custom_surroundings = {
          ['('] = { input = { '%b()', '^.().*().$' }, output = { left = '(', right = ')' } },
          ['['] = { input = { '%b[]', '^.().*().$' }, output = { left = '[', right = ']' } },
          ['{'] = { input = { '%b{}', '^.().*().$' }, output = { left = '{', right = '}' } },
          ['<'] = { input = { '%b<>', '^.().*().$' }, output = { left = '<', right = '>' } },
        },
        n_lines = 500,
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
