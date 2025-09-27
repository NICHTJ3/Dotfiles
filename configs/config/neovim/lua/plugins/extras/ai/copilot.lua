return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        -- copilot.lua only works with its own copilot lsp server
        copilot = { enabled = false },
      },
    },
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'BufReadPost',
    dependencies = {
      {
        'copilotlsp-nvim/copilot-lsp', -- (Optional) for nes
        init = function()
          vim.g.copilot_nes_debounce = 400
        end,
      },
    },
    opts = {
      nes = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept_and_goto = '<c-y>',
          accept = false,
          dismiss = '<Esc>',
        },
      },
      suggestion = {
        enabled = true,
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
        yaml = true,
        markdown = true,
        help = true,
      },
    },
    init = function()
      Core.cmp.actions.ai_accept = function()
        if require('copilot.suggestion').is_visible() then
          require('copilot.suggestion').accept()
          return true
        end
      end
    end,
  },
  {
    'saghen/blink.cmp',
    optional = true,
    -- NOTE: checkup on this issue at somepoint see if swapping from blink-cmp-copilot was a good idea:
    -- https://github.com/LazyVim/LazyVim/pull/5551/files
    dependencies = { 'fang2hou/blink-copilot' },
    opts = {
      sources = {
        default = { 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
