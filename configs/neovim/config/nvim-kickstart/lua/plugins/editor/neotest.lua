return {
  'nvim-neotest/neotest',
  cmd = {
    'Neotest',
  },
  --   keys = {
  --     <leader>t	+test	n
  -- <leader>Tl	Run Last	n
  -- <leader>To	Show Output	n
  -- <leader>TO	Toggle Output Panel	n
  -- <leader>Tr	Run Nearest	n
  -- <leader>Ts	Toggle Summary	n
  -- <leader>TS	Stop	n
  -- <leader>Tt	Run File	n
  -- <leader>TT	Run All Test Files	n
  -- <leader>Tw	Toggle Watch	n
  --
  --   },
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Adapters
    'nvim-neotest/neotest-jest',
    'marilari88/neotest-vitest',
    'rouge8/neotest-rust',
    'Issafalcon/neotest-dotnet',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'npm test -- --',
        },
        require 'neotest-dotnet' {
          dotnet_additional_args = {
            '-e ASPNETCORE_ENVIRONMENT=Development',
          },
        },
        require 'neotest-vitest',
        require 'neotest-rust',
      },
    }
  end,
}
