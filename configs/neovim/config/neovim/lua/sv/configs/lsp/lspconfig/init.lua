local lspconfig = require('lspconfig')
local sumneko_lua = require('sv.configs.lsp.lspconfig.sumneko_lua')

local eslintls = require("sv.configs.lsp.lspconfig.eslintls")
local denols = require("sv.configs.lsp.lspconfig.denols")
local tsserver = require('sv.configs.lsp.lspconfig.tsserver')
local cssls = require('sv.configs.lsp.lspconfig.cssls')
local tailwindcss = require('sv.configs.lsp.lspconfig.tailwindcss')

lspconfig.util.default_config.capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities())

local configs = {
    tsserver = tsserver.config,
    stylelint_lsp = {
        filetypes = {
            "css", "less", "scss", "sugarss", "wxss"
        },
        on_new_config = function(config, new_root_dir)
            local stylelint_config = require("lspconfig.server_configurations.stylelint_lsp")
            local cmd = stylelint_config.default_config.cmd
            stylelint_config.default_config.on_new_config(config, new_root_dir)
            config.cmd = eslintls.get_cmd(cmd)
        end
    },
    cssls = cssls.config,
    eslint = eslintls.config,
    denols = denols.config,
    sumneko_lua = sumneko_lua.config,
    jsonls = {
        settings = { json = { schemas = require('schemastore').json.schemas() } }
    },
    tailwindcss = tailwindcss.config,
    graphql = {
        root_dir = lspconfig.util.root_pattern('.graphqlrc*',
            '.graphql.config.*',
            'graphql.config.*')
    }

}

local M = {}

M.configs = configs

return M
