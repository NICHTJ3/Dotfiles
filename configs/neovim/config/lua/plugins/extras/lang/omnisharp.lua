return {
  { 'Hoffs/omnisharp-extended-lsp.nvim', lazy = true },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'c_sharp' } },
  },
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = {
      formatters_by_ft = {
        cs = { 'csharpier' },
      },
      formatters = {
        csharpier = {
          command = 'dotnet-csharpier',
          args = { '--write-stdout' },
        },
      },
    },
  },
  {
    'williamboman/mason.nvim',
    opts = { ensure_installed = { 'csharpier', 'netcoredbg' } },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        -- omnisharp@v1.39.8 seems to be more performant if you run into issues
        omnisharp = {
          handlers = {
            ['textDocument/definition'] = function(...)
              require('omnisharp_extended').definition_handler(...)
            end,
            ['textDocument/typeDefinition'] = function(...)
              require('omnisharp_extended').type_definition_handler(...)
            end,
            ['textDocument/references'] = function(...)
              require('omnisharp_extended').references_handler(...)
            end,
            ['textDocument/implementation'] = function(...)
              require('omnisharp_extended').implementation_handler(...)
            end,
          },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
    },
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
              ---@diagnostic disable-next-line: redundant-parameter
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
}
