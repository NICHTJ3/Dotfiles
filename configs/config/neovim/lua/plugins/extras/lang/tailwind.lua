return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              classFunctions = { 'cn', 'cx', 'cva', 'tv' },
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
      document_color = {
        kind = 'inline', -- "inline" | "foreground" | "background"
        inline_symbol = ' ', -- only used in inline mode
        debounce = 200, -- in milliseconds, only applied in insert mode
      },
    },
  },
}
