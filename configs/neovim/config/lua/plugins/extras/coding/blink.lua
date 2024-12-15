---@diagnostic disable: missing-fields

return {
  {
    'saghen/blink.cmp',
    version = '*',
    opts_extend = {
      'sources.completion.enabled_providers',
      'sources.compat',
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
      highlight = {
        use_nvim_cmp_as_default = false,
      },
      nerd_font_variant = 'mono',
      completion = {
        menu = {
          winblend = vim.o.pumblend,
          draw = { treesitter = true },
        },
        documentation = {
          auto_show = true,
          treesitter_highlighting = true,
        },
        ghost_text = {
          enabled = false,
        },
      },

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } },

      -- experimental signature help support
      signature = {
        enabled = true,
      },

      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = {},
        completion = {
          -- remember to enable your providers here
          enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
        },
      },
    },
    ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
    config = function(_, opts)
      -- setup compat sources
      local enabled = opts.sources.completion.enabled_providers
      for _, source in ipairs(opts.sources.compat or {}) do
        opts.sources.providers[source] = vim.tbl_deep_extend('force', { name = source, module = 'blink.compat.source' }, opts.sources.providers[source] or {})
        if type(enabled) == 'table' and not vim.tbl_contains(enabled, source) then
          table.insert(enabled, source)
        end
      end
      require('blink.cmp').setup(opts)
    end,
  },

  -- lazydev
  {
    'saghen/blink.cmp',
    opts = {
      sources = {
        completion = {
          -- add lazydev to your completion providers
          enabled_providers = { 'lazydev' },
        },
        providers = {
          lsp = {
            -- dont show LuaLS require statements when lazydev has items
            fallback_for = { 'lazydev' },
          },
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
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
}
