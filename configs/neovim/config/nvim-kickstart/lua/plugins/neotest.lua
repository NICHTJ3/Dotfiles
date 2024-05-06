return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Adapters
    'nvim-neotest/neotest-jest',
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('neotest').setup {
      adapters = {
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
