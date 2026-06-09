return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'c_sharp' } },
  },
  {
    'mfussenegger/nvim-dap',
    optional = true,
    opts = function()
      local dap = require 'dap'
      if not dap.adapters['netcoredbg'] then
        require('dap').adapters['netcoredbg'] = {
          type = 'executable',
          command = vim.fn.exepath 'netcoredbg',
          args = { '--interpreter=vscode' },
          options = {
            detached = false,
          },
        }
      end
      for _, lang in ipairs { 'cs', 'fsharp', 'vb' } do
        if not dap.configurations[lang] then
          dap.configurations[lang] = {
            {
              type = 'netcoredbg',
              name = 'Launch file',
              request = 'launch',
              program = function()
                return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/', 'file')
              end,
              cwd = '${workspaceFolder}',
            },
          }
        end
      end
    end,
  },
  {
    'nvim-neotest/neotest',
    optional = true,
    dependencies = {
      'Issafalcon/neotest-dotnet',
    },
    opts = {
      adapters = {
        ['neotest-dotnet'] = {
          dotnet_additional_args = {
            '-e ASPNETCORE_ENVIRONMENT=Development',
          },
        },
      },
    },
  },
  {
    'mason-org/mason.nvim',
    opts = {
      ensure_installed = { 'csharpier', 'netcoredbg', 'roslyn' },
      registries = {
        -- NOTE: Temporarily adding this registy, until https://github.com/mason-org/mason-registry/pull/6330 is merged
        'github:Crashdummyy/mason-registry',
      },
    },
  },
  {
    'seblyng/roslyn.nvim',
    ft = {
      'cs',
      'razor',
      'cshtml',
    },
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      filewatching = 'roslyn',
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        roslyn = {
          settings = {
            ['csharp|background_analysis'] = {
              dotnet_analyzer_diagnostics_scope = 'fullSolution',
              dotnet_compiler_diagnostics_scope = 'fullSolution',
            },
            ['csharp|code_lens'] = {
              dotnet_enable_references_code_lens = true,
            },
            ['csharp|completion'] = {
              dotnet_show_name_completion_suggestions = true,
              dotnet_show_completion_items_from_unimported_namespaces = true,
              dotnet_provide_regex_completions = true,
            },
            ['csharp|inlay_hints'] = {
              csharp_enable_inlay_hints_for_implicit_object_creation = true,
              csharp_enable_inlay_hints_for_implicit_variable_types = true,
              csharp_enable_inlay_hints_for_lambda_parameter_types = true,
              csharp_enable_inlay_hints_for_types = true,
              dotnet_enable_inlay_hints_for_indexer_parameters = true,
              dotnet_enable_inlay_hints_for_literal_parameters = true,
              dotnet_enable_inlay_hints_for_object_creation_parameters = true,
              dotnet_enable_inlay_hints_for_other_parameters = true,
              dotnet_enable_inlay_hints_for_parameters = true,
            },
          },
        },
      },
    },
  },
}
