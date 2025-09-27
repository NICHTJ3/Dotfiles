local status = {} ---@type table<number, "ok" | "error" | "pending">

return {
  -- copilot-language-server
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        copilot = {
          -- stylua: ignore
          keys = {
            {
              "‘", -- <M-]>
              function() vim.lsp.inline_completion.select({ count = 1 }) end,
              desc = "Next Copilot Suggestion",
              mode = { "i", "n" },
            },
            {
              "“", -- <M-[>
              function() vim.lsp.inline_completion.select({ count = -1 }) end,
              desc = "Next Copilot Suggestion",
              mode = { "i", "n" },
            },
          },
        },
      },
      setup = {
        copilot = function()
          vim.lsp.inline_completion.enable()
          -- Accept inline suggestions or next edits
          Core.cmp.actions.ai_accept = function()
            return vim.lsp.inline_completion.get()
          end

          if not Core.has 'sidekick.nvim' then
            vim.lsp.config('copilot', {
              handlers = {
                didChangeStatus = function(err, res, ctx)
                  if err then
                    return
                  end
                  status[ctx.client_id] = res.kind ~= 'Normal' and 'error' or res.busy and 'pending' or 'ok'
                  if res.status == 'Error' then
                    Core.error 'Please use `:LspCopilotSignIn` to sign in to Copilot'
                  end
                end,
              },
            })
          end
        end,
      },
    },
  },
  {
    'folke/sidekick.nvim',
    lazy = false,
    opts = function()
      -- Accept inline suggestions or next edits
      Core.cmp.actions.ai_nes = function()
        local Nes = require 'sidekick.nes'
        if Nes.have() and (Nes.jump() or Nes.apply()) then
          return true
        end
      end
    end,
    keys = {
      -- nes is also useful in normal mode
      { '<c-y>', Core.cmp.map({ 'ai_nes' }, '<c-y>'), mode = { 'n' }, expr = true },
    },
  },
}
