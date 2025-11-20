local lspconfig = require 'lspconfig'

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        xui = {
          cmd = { 'node', '/Users/trent.nicholson/Documents/work/xui-lsp/packages/server/dist/server.js' },
          filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'scss', 'sass' },
          root_markers = { 'package.json', '.git' },
          settings = {
            xui = {
              enableColorPreview = true,
              experimental = {
                namespaces = true,
              },
            },
          },
        },
      },
    },
  },
}
