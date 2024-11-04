return {
  {
    'neovim/nvim-lspconfig',
    opt = false,
    -- other settings removed for brevity
    opts = {
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = 'auto' },
          },
        },
      },
      setup = {
        eslint = function()
          return {
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = true
            end,
          }
        end,
      },
    },
  },
}
