return {
  'nvim-neotest/neotest',
  cmd = {
    'Neotest',
  },
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Adapters
    'nvim-neotest/neotest-jest',
    'marilari88/neotest-vitest',
    'rouge8/neotest-rust',
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('neotest').setup {
      adapters = {
        require 'neotest-rust',
        require 'neotest-vitest',
        require 'neotest-jest' {
          jestCommand = 'npm test -- --',
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    }
  end,
}
