return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'odin' } },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        ols = {},
      },
    },
  },
}
