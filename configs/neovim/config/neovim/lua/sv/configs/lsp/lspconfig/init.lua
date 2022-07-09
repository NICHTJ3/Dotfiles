local lspconfig = require('lspconfig')
local sumneko_lua = require('sv.configs.lsp.lspconfig.sumneko_lua')
local utils = require("sv.configs.lsp.lspconfig.utils")

local cssls = require('sv.configs.lsp.lspconfig.cssls')
local denols = require("sv.configs.lsp.lspconfig.denols")
local eslint = require("sv.configs.lsp.lspconfig.eslint")
local tailwindcss = require('sv.configs.lsp.lspconfig.tailwindcss')
local tsserver = require('sv.configs.lsp.lspconfig.tsserver')

lspconfig.util.default_config.capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities())

local M = {}

M.configs = {
    cssls = cssls.config,
    denols = denols.config,
    eslint = eslint.config,
    graphql = { root_dir = lspconfig.util.root_pattern('.graphqlrc*', '.graphql.config.*', 'graphql.config.*') }
    jsonls = { settings = { json = { schemas = require('schemastore').json.schemas() } } },
    stylelint_lsp = { filetypes = { "css", "less", "scss", "sugarss", "wxss" }, on_new_config = function(config, new_root_dir) local stylelint_config = require("lspconfig.server_configurations.stylelint_lsp") local cmd = stylelint_config.default_config.cmd stylelint_config.default_config.on_new_config(config, new_root_dir) config.cmd = utils.get_cmd(cmd) end },
    sumneko_lua = sumneko_lua.config,
    tailwindcss = tailwindcss.config,
    tsserver = tsserver.config,
}

return M
