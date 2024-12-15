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
}
