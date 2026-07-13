return {
  {
    'tiesen243/vercel.nvim',
    lazy = false,
    opts = {
      theme = 'dark',
    },
  },
  { 'folke/tokyonight.nvim', lazy = false, opts = { style = 'night' } },
  { 'olimorris/onedarkpro.nvim', lazy = false },
  { 'rebelot/kanagawa.nvim', lazy = false },
  { 'scottmckendry/cyberdream.nvim', lazy = false },
  -- catppuccin
  {
    'catppuccin/nvim',
    lazy = true,
    name = 'catppuccin',
    opts = {
      integrations = {
        cmp = true,
        dashboard = true,
        grug_far = true,
        gitsigns = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
        neotest = true,
        neotree = true,
        semantic_tokens = true,
        snacks = true,
        telescope = {
          enabled = true,
          style = 'nvchad',
        },
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        'akinsho/bufferline.nvim',
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ''):find 'catppuccin' then
            opts.highlights = require('catppuccin.special.bufferline').get_theme()
          end
        end,
      },
    },
  },
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    opts = {
      glow = true,
    },
  },
  {
    'rose-pine/neovim',
    lazy = false,
    name = 'rose-pine',
    opts = {
      dark_variant = 'main',
      disable_background = true,
      disable_float_background = true,
    },
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    opts = {
      transparent_mode = true,
      overrides = {
        NormalFloat = { bg = '#1d2021' },
        FloatBorder = { bg = '#1d2021' },
      },
    },
  },
}
