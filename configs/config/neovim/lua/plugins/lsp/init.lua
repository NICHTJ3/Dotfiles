---@alias LspConfig vim.lsp.Config | { mason?: boolean, enabled?: boolean }

return {
  -- lspconfig
  {
    'neovim/nvim-lspconfig',
    version = 'v2.x',
    event = 'LazyFile',
    dependencies = {
      'mason.nvim',
      { 'mason-org/mason-lspconfig.nvim', config = function() end },
    },
    opts = function()
      ---@class PluginLspOpts
      local ret = {
        -- options for vim.diagnostic.config()
        ---@type vim.diagnostic.Opts
        diagnostics = {
          underline = not vim.env.TMUX,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = 'if_many',
            prefix = '●',
            -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
            -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
            -- prefix = "icons",
          },
          severity_sort = true,
        },
        -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the inlay hints.
        inlay_hints = {
          enabled = false,
          exclude = { 'vue' }, -- filetypes for which you don't want to enable inlay hints
        },
        -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the code lenses.
        codelens = {
          enabled = false,
        },
        -- Enable lsp cursor word highlighting
        document_highlight = {
          enabled = true,
        },
        -- add any global capabilities here
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
        -- LSP Server Settings
        ---@type table<string, LspConfig>
        servers = {
          lua_ls = {
            -- mason = false, -- set to false if you don't want this server to be installed with mason
            -- Use this to add any additional keymaps
            -- for specific lsp servers
            -- ---@type LazyKeysSpec[]
            -- keys = {},
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = 'Replace',
                },
                doc = {
                  privateName = { '^_' },
                },
                hint = {
                  enable = true,
                  setType = false,
                  paramType = true,
                  paramName = 'Disable',
                  semicolon = 'Disable',
                  arrayIndex = 'Disable',
                },
              },
            },
          },
        },
        -- you can do any additional lsp server setup here
        -- return true if you don't want this server to be setup with lspconfig
        ---@type table<string, fun(server:string, LspConfig):boolean?>
        setup = {
          -- example to setup with typescript.nvim
          -- ts_ls = function(_, opts)
          --   require("typescript").setup({ server = opts })
          --   return true
          -- end,
          -- Specify * to use this function as a fallback for any server
          -- ["*"] = function(server, opts) end,
        },
      }
      return ret
    end,
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- setup keymaps
      Core.lsp.on_attach(function(client, buffer)
        require('plugins.lsp.keymaps').on_attach(client, buffer)
      end)

      Core.lsp.setup()
      Core.lsp.on_dynamic_capability(require('plugins.lsp.keymaps').on_attach)

      if vim.fn.has 'nvim-0.10' == 1 then
        -- inlay hints
        if opts.inlay_hints.enabled then
          Core.lsp.on_supports_method('textDocument/inlayHint', function(client, buffer)
            if
              vim.api.nvim_buf_is_valid(buffer)
              and vim.bo[buffer].buftype == ''
              and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
            then
              vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
            end
          end)
        end

        -- code lens
        if opts.codelens.enabled and vim.lsp.codelens then
          Core.lsp.on_supports_method('textDocument/codeLens', function(client, buffer)
            vim.lsp.codelens.refresh()
            vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
              buffer = buffer,
              callback = vim.lsp.codelens.refresh,
            })
          end)
        end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local has_blink, blink = pcall(require, 'blink.cmp')

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, 'mason-lspconfig')
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require('mason-lspconfig').get_mappings().lspconfig_to_package)
      end

      local exclude_automatic_enable = {} ---@type string[]

      -- Set default lsp capabilities
      vim.lsp.config('*', {
        -- Some servers require this to be set when using vim.lsp.config, so we just set it globally
        init_options = {},
        capabilities = vim.tbl_deep_extend(
          'force',
          {},
          vim.lsp.protocol.make_client_capabilities(),
          has_blink and blink.get_lsp_capabilities() or {},
          opts.capabilities or {}
        ),
      })

      local function configure(server)
        local server_opts = servers[server] or {}
        if server_opts.enabled == false then
          return
        end

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup['*'] then
          if opts.setup['*'](server, server_opts) then
            return
          end
        end

        vim.lsp.config(server, server_opts)

        -- manually enable if mason=false or if this is a server that cannot be installed with mason-lspconfig
        if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
          vim.lsp.enable(server)
          return true
        end
        return false
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.enabled ~= false then
            if configure(server) then
              exclude_automatic_enable[#exclude_automatic_enable + 1] = server
            else
              ensure_installed[#ensure_installed + 1] = server
            end
          end
        end
      end

      if have_mason then
        mlsp.setup {
          ensure_installed = vim.tbl_deep_extend('force', ensure_installed, Core.opts('mason-lspconfig.nvim').ensure_installed or {}),
          automatic_enable = {
            exclude = exclude_automatic_enable,
          },
        }
      end
    end,
  },

  -- cmdline tools and lsp servers
  {

    'mason-org/mason.nvim',
    cmd = 'Mason',
    keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
    build = ':MasonUpdate',
    opts_extend = { 'ensure_installed' },
    opts = {
      ensure_installed = {
        'stylua',
        'shfmt',
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require('mason').setup(opts)
      local mr = require 'mason-registry'
      mr:on('package:install:success', function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require('lazy.core.handler.event').trigger {
            event = 'FileType',
            buf = vim.api.nvim_get_current_buf(),
          }
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
}
