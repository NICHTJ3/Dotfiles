return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    event = 'VimEnter',
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

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = true, trim_left = 1 }
      --
      -- -- You can configure sections in the statusline by overriding their
      -- -- default behavior. For example, here we set the section for
      -- -- cursor location to LINE:COLUMN
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end
      --
      -- statusline.section_filename = function()
      --   -- Just use the plain file name without the path in statusline
      --   return '%t'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
