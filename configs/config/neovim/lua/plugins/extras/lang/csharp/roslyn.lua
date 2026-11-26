-- on_attach over `on` since snacks may not be loaded yet.
require('core.util.lsp').on_attach(function(client, buf)
  if client.name ~= 'roslyn_ls' and client.name ~= 'roslyn' then
    return
  end

  -- Add RoslySwitchSln command to switch between .sln files
  vim.api.nvim_buf_create_user_command(buf, 'RoslynSwitchSln', function()
    -- Search for solution files from the current working directory
    local slns = vim.fs.find(function(name)
      return name:match '%.slnx?$' or name:match '%.slnf$'
    end, { path = vim.fn.getcwd(), type = 'file', limit = math.huge })

    if #slns == 0 then
      vim.notify('No .sln, .slnx, or .slnf files found.', vim.log.levels.WARN)
      return
    end

    vim.ui.select(slns, {
      prompt = 'Select Roslyn Solution:',
      format_item = function(item)
        return vim.fn.fnamemodify(item, ':.')
      end,
    }, function(choice)
      if choice then
        client:notify('solution/open', {
          solution = vim.uri_from_fname(choice),
        })
        vim.notify('Switched Roslyn solution to: ' .. vim.fn.fnamemodify(choice, ':t'))
      end
    end)
  end, { desc = 'Switch active Roslyn .sln file' })
end)

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
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        roslyn_ls = {
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = false,
              },
            },
          },
        },
      },
    },
  },
  -- { 'seblyng/roslyn.nvim', }, -- TODO: I'd like to re-anable this, but the exit times are unbareable
}
