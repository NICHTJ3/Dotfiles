return {
  {
    'yetone/avante.nvim',
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    event = 'LazyFile',
    opts = {
      provider = 'copilot',
      file_selector = {
        provider = 'snacks',
        provider_opts = {},
      },
    },
    build = 'make',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'zbirenbaum/copilot.lua',
      --- The below dependencies are optional,
      {
        'MeanderingProgrammer/render-markdown.nvim',
        optional = true,
        opts = {
          file_types = { 'Avante' },
        },
        ft = { 'Avante' },
      },
    },
  },
  {
    'saghen/blink.cmp',
    optional = true,
    dependencies = { 'Kaiser-Yang/blink-cmp-avante' },
    opts = {
      sources = {
        default = { 'avante' },
        providers = {
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {},
          },
        },
      },
    },
  },
}
