return {
  -- Treesitter git support
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'git_config', 'gitcommit', 'git_rebase', 'gitignore', 'gitattributes' } },
  },
  {
    'tpope/vim-fugitive',
    keys = {
      {
        '<leader>gc',
        '<cmd>G commit<CR>',
        desc = 'Git commit',
      },
    },
  },
  {
    'saghen/blink.cmp',
    enabled = false,
    dependencies = { { 'Kaiser-Yang/blink-cmp-git', event = 'VeryLazy', dependencies = { 'nvim-lua/plenary.nvim' } } },
    opts = {
      sources = {
        default = { 'git' },
        providers = {
          git = {
            module = 'blink-cmp-git',
            name = 'Git',
            enabled = function()
              return vim.bo.filetype == 'gitcommit'
            end,
            opts = {},
          },
        },
      },
    },
  },
  {
    -- Added until nvim-lspconfig merges: https://github.com/williamboman/mason-lspconfig.nvim/pull/506
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        gh_actions_ls = {},
      },
    },
  },
}
