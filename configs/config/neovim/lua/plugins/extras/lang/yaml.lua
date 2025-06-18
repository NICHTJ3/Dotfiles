return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'yaml' } },
  },
  {
    'b0o/SchemaStore.nvim',
    lazy = true,
    version = false,
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      -- make sure mason installs the server
      servers = {
        yamlls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require('schemastore').yaml.schemas())
          end,
        },
      },
    },
  },
}
