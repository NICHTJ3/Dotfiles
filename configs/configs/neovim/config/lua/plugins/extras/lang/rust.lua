return {
  -- Extend auto completion
  {
    'Saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },

  -- Add Rust & related to treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'rust', 'ron' } },
  },

  -- Ensure Rust debugger is installed
  {
    'williamboman/mason.nvim',
    optional = true,
    opts = { ensure_installed = { 'codelldb' } },
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    ft = { 'rust' },
    lazy = false, -- This plugin is already lazy
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set('n', '<leader>cR', function()
            vim.cmd.RustLsp 'codeAction'
          end, { desc = 'Code Action', buffer = bufnr })
          vim.keymap.set('n', '<leader>dr', function()
            vim.cmd.RustLsp 'debuggables'
          end, { desc = 'Rust Debuggables', buffer = bufnr })
        end,
        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            -- Add clippy lints for Rust.
            checkOnSave = true,
            procMacro = {
              enable = true,
              ignored = {
                ['async-trait'] = { 'async_trait' },
                ['napi-derive'] = { 'napi' },
                ['async-recursion'] = { 'async_recursion' },
              },
            },
            files = {
              excludeDirs = {
                '.direnv',
                '.git',
                '.github',
                '.gitlab',
                'bin',
                'node_modules',
                'target',
                'venv',
                '.venv',
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend('keep', vim.g.rustaceanvim or {}, opts or {})
      if vim.fn.executable 'rust-analyzer' == 0 then
        Core.error('**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/', { title = 'rustaceanvim' })
      end
    end,
  },

  -- Correctly setup lspconfig for Rust 🚀
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        taplo = {
          keys = {
            {
              'K',
              function()
                if vim.fn.expand '%:t' == 'Cargo.toml' and require('crates').popup_available() then
                  require('crates').show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = 'Show Crate Documentation',
            },
          },
        },
      },
    },
  },

  {
    'nvim-neotest/neotest',
    optional = true,
    opts = {
      adapters = {
        ['rustaceanvim.neotest'] = {},
      },
    },
  },
}
