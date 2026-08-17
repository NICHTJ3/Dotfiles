return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              classFunctions = { 'cn', 'cx', 'cva', 'tv' },
              classAttributes = { 'class', 'className', 'ngClass', 'tw', 'twClass', 'classNames' },
            },
          },
        },
      },
    },
  },
}
