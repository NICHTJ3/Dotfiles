return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              classFunctions = { 'cn', 'cx', 'cva' },
            },
          },
        },
      },
    },
  },
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    event = 'LazyFile',
    ft = { 'css', 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      server = {
        override = false,
      },
    },
  },
}
