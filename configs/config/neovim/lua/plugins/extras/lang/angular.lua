return {
  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'angular', 'scss' })

      -- Detect Angular workspaces via angular.json and force html files to htmlangular,
      vim.filetype.add {
        pattern = {
          ['.*%.html'] = function(path)
            if vim.fs.find('angular.json', { path = vim.fs.dirname(path), upward = true })[1] then
              return 'htmlangular'
            end
          end,
        },
      }
    end,
  },

  -- LSP
  { import = 'plugins.extras.lang.typescript' }, -- angularls depends on typescript so make sure it's enabled
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        angularls = {},
        vtsls = {
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  {
                    name = '@angular/language-server',
                    location = Core.get_pkg_path('angular-language-server', '/node_modules/@angular/language-server'),
                    enableForWorkspaceTypeScriptVersions = false,
                  },
                },
              },
            },
          },
        },
      },
      setup = {
        angularls = function(_, opts)
          Core.lsp.on({ name = 'vtsls' }, function(_, client)
            --HACK: disable vtsls renaming and reference capabilities to avoid duplicates
            client.server_capabilities.referencesProvider = false
            client.server_capabilities.renameProvider = false
          end)
        end,
      },
    },
  },

  -- Formatting
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        htmlangular = { 'prettier' },
      },
    },
  },
}
