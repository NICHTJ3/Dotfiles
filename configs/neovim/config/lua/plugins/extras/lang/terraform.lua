return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'terraform', 'hcl' } },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        terraformls = {},
      },
    },
  },
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = {
      formatters_by_ft = {
        terraform = { 'terraform_fmt' },
        tf = { 'terraform_fmt' },
        ['terraform-vars'] = { 'terraform_fmt' },
      },
    },
  },
}
