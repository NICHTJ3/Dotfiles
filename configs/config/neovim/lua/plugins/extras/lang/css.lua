return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'scss', 'css' } },
  },
  {
    'williamboman/mason.nvim',
    opts = { ensure_installed = { 'some-sass-language-server' } },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        somesass_ls = {
          settings = {
            editor = {
              wordBasedSuggestions = false,
            },
            workspace = {
              exclude = {
                '**/.git/**',
                '**/node_modules/**',
              },
            },
            somesass = {
              suggestAllFromOpenDocument = false,
              scss = {
                completion = { suggestFromUseOnly = true },
                colors = { enabled = true },
              },
              sass = { completion = { suggestFromUseOnly = true } },
            },
          },
        },
      },
    },
  },
}
