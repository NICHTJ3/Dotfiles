---@diagnostic disable: missing-fields

return {
  {
    'saghen/blink.cmp',
    version = '*',
    opts_extend = {
      'sources.completion.enabled_providers',
      'sources.compat',
      'sources.default',
    },
    dependencies = {
      'rafamadriz/friendly-snippets',
      {
        'saghen/blink.compat',
        optional = true, -- make optional so it's only enabled if any extras need it
        opts = {},
        version = '*',
      },
    },
    event = 'InsertEnter',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = false,
          },
        },
        menu = {
          draw = {
            treesitter = { 'lsp' },
            columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', gap = 1, 'kind' } },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = true,
        },
      },
      cmdline = { enabled = true },
      signature = { enabled = true },

      sources = {
        -- adding any nvim-cmp sources here will enable them with blink.compat
        compat = {},
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      keymap = {
        preset = 'default',
        ['<c-y>'] = {
          'select_and_accept',
          Core.cmp.map { 'snippet_forward', 'ai_accept' },
          'fallback',
        },
        ['<tab>'] = {
          'select_and_accept',
          Core.cmp.map { 'snippet_forward', 'ai_accept' },
          'fallback',
        },
      },
    },
    ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
    config = function(_, opts)
      -- setup compat sources
      local enabled = opts.sources.default
      for _, source in ipairs(opts.sources.compat or {}) do
        opts.sources.providers[source] = vim.tbl_deep_extend('force', { name = source, module = 'blink.compat.source' }, opts.sources.providers[source] or {})
        if type(enabled) == 'table' and not vim.tbl_contains(enabled, source) then
          table.insert(enabled, source)
        end
      end
      opts.sources.compat = nil

      require('blink.cmp').setup(opts)
    end,
  },
  -- lazydev
  {
    'saghen/blink.cmp',
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { 'lazydev' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100, -- show at a higher priority than lsp
          },
        },
      },
    },
  },

  -- catppuccin support
  {
    'catppuccin',
    optional = true,
    opts = {
      integrations = { blink_cmp = true },
    },
  },

  -- Hide copilot.lua suggestions when copilot is open
  {
    'zbirenbaum/copilot.lua',
    opt = true,
    opts = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'BlinkCmpMenuOpen',
        callback = function()
          vim.b.copilot_suggestion_hidden = true
        end,
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'BlinkCmpMenuClose',
        callback = function()
          vim.b.copilot_suggestion_hidden = false
        end,
      })
    end,
  },
}
