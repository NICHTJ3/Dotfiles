local common_on_attach = require('sv.configs.lsp').common_on_attach
local get_cmd = require('sv.configs.lsp.lspconfig.eslintls').get_cmd

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local M = {}

local tsserver_config = require("lspconfig.server_configurations.tsserver")
local cmd = tsserver_config.default_config.cmd

M.config = {
    cmd = cmd,
    filetypes = {
        'typescriptreact', 'typescript', 'typescript.tsx', 'javascript',
        'javascriptreact'
    },
    commands = {
        OrganizeImports = {organize_imports, description = "Organize Imports"}
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        common_on_attach(client, bufnr)
    end

}

return M
