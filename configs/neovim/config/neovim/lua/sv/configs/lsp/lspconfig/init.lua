local lspconfig = require('lspconfig')

local eslintls = require("sv.configs.lsp.lspconfig.eslintls")
local tsserver = require('sv.configs.lsp.lspconfig.tsserver')
local cssls = require('sv.configs.lsp.lspconfig.cssls')

lspconfig.util.default_config.capabilities =
    require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities())

local configs = {
    tsserver = tsserver.config,
    cssls = cssls.config,
    eslint = eslintls.config
}

local M = {}

M.configs = configs

return M
