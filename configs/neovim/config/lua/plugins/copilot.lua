return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'BufReadPost',
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true,
        hide_during_completion = true,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = '<M-]>',
          prev = '<M-[>',
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    'saghen/blink.cmp',
    optional = true,
    dependencies = { 'giuxtaposition/blink-cmp-copilot' },
    opts = {
      sources = {
        default = { 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            -- kind = 'Copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      provider = 'copilot',
    },
    enabled = function()
      local ok = pcall(require('copilot.auth').get_cred)
      return ok
    end,
    build = 'make',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'zbirenbaum/copilot.lua',
      --- The below dependencies are optional,
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}
