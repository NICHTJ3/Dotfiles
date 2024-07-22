return {
  -- auto completion
  {
    'hrsh7th/nvim-cmp',
    version = false, -- last release is way too old
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    opts = function()
      vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
      local cmp = require 'cmp'
      local defaults = require 'cmp.config.default'()
      local auto_select = true
      return {
        completion = { completeopt = 'menu,menuone,noinsert' },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert {
          -- Manually trigger a completion from nvim-cmp.
          ['<C-Space>'] = cmp.mapping.complete {},
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping(function()
            cmp.confirm { select = true }
          end, { 'i', 's' }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        }),
        formatting = {
          format = function(_entry, item)
            local widths = {
              abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
              menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
            }

            for key, width in pairs(widths) do
              if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. '…'
              end
            end

            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = 'CmpGhostText',
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },

  -- snippets
  {
    'nvim-cmp',
    dependencies = {
      {
        'garymjr/nvim-snippets',
        opts = {
          friendly_snippets = true,
        },
        dependencies = { 'rafamadriz/friendly-snippets' },
      },
    },
    opts = function(_, opts)
      opts.snippet = {
        expand = function(item)
          return vim.snippet.expand(item.body)
        end,
      }
      if Core.has 'nvim-snippets' then
        table.insert(opts.sources, { name = 'snippets' })
      end
    end,
    keys = {
      {
        '<C-l>',
        function()
          return vim.snippet.active { direction = 1 } and '<cmd>lua vim.snippet.jump(1)<cr>' or '<C-l>'
        end,
        expr = true,
        silent = true,
        mode = { 'i', 's' },
      },
      {
        '<C-h>',
        function()
          return vim.snippet.active { direction = -1 } and '<cmd>lua vim.snippet.jump(-1)<cr>' or '<C-h>'
        end,
        expr = true,
        silent = true,
        mode = { 'i', 's' },
      },
    },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- Manage libuv types with lazy. Plugin will never be loaded
  { 'Bilal2453/luvit-meta', lazy = true },
  -- Add lazydev source to cmp
  {
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      table.insert(opts.sources, { name = 'lazydev', group_index = 0 })
    end,
  },
  {
    {
      'nvim-neotest/neotest',
      dependencies = { 'nvim-neotest/nvim-nio' },
      opts = {
        -- Can be a list of adapters like what neotest expects,
        -- or a list of adapter names,
        -- or a table of adapter names, mapped to adapter configs.
        -- The adapter will then be automatically loaded with the config.
        adapters = {},
        -- Example for loading neotest-golang with a custom config
        -- adapters = {
        --   ["neotest-golang"] = {
        --     go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
        --     dap_go_enabled = true,
        --   },
        -- },
        status = { virtual_text = true },
        output = { open_on_run = true },
        quickfix = {
          open = function()
            if Core.has 'trouble.nvim' then
              require('trouble').open { mode = 'quickfix', focus = false }
            else
              vim.cmd 'copen'
            end
          end,
        },
      },
      config = function(_, opts)
        local neotest_ns = vim.api.nvim_create_namespace 'neotest'
        vim.diagnostic.config({
          virtual_text = {
            format = function(diagnostic)
              -- Replace newline and tab characters with space for more compact diagnostics
              local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
              return message
            end,
          },
        }, neotest_ns)

        if Core.has 'trouble.nvim' then
          opts.consumers = opts.consumers or {}
          -- Refresh and auto close trouble after running tests
          ---@type neotest.Consumer
          opts.consumers.trouble = function(client)
            client.listeners.results = function(adapter_id, results, partial)
              if partial then
                return
              end
              local tree = assert(client:get_position(nil, { adapter = adapter_id }))

              local failed = 0
              for pos_id, result in pairs(results) do
                if result.status == 'failed' and tree:get_key(pos_id) then
                  failed = failed + 1
                end
              end
              vim.schedule(function()
                local trouble = require 'trouble'
                if trouble.is_open() then
                  trouble.refresh()
                  if failed == 0 then
                    trouble.close()
                  end
                end
              end)
            end
            return {}
          end
        end

        if opts.adapters then
          local adapters = {}
          for name, config in pairs(opts.adapters or {}) do
            if type(name) == 'number' then
              if type(config) == 'string' then
                config = require(config)
              end
              adapters[#adapters + 1] = config
            elseif config ~= false then
              local adapter = require(name)
              if type(config) == 'table' and not vim.tbl_isempty(config) then
                local meta = getmetatable(adapter)
                if adapter.setup then
                  adapter.setup(config)
                elseif adapter.adapter then
                  adapter.adapter(config)
                  adapter = adapter.adapter
                elseif meta and meta.__call then
                  adapter(config)
                else
                  error('Adapter ' .. name .. ' does not support setup')
                end
              end
              adapters[#adapters + 1] = adapter
            end
          end
          opts.adapters = adapters
        end

        require('neotest').setup(opts)
      end,
    -- stylua: ignore
    keys = {
      {"<leader>t", "", desc = "+test"},
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
      { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch" },
    },
    },
    {
      'mfussenegger/nvim-dap',
      optional = true,
      -- stylua: ignore
      keys = {
        { "<leader>td", function() require("neotest").run.run({strategy = "dap", suite = false}) end, desc = "Debug Nearest" },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
