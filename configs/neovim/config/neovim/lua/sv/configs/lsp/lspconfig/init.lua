local eslintlsConfig = require("sv.configs.lsp.lspconfig.eslintls").config

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local cssCapabilities = vim.lsp.protocol.make_client_capabilities()
cssCapabilities.textDocument.completion.completionItem.snippetSupport = true

local configs = {
    tsserver = {
        filetypes = {
            'typescriptreact', 'typescript', 'typescript.tsx', 'javascript',
            'javascriptreact'
        },
        commands = {
            OrganizeImports = {
                organize_imports,
                description = "Organize Imports"
            }
        }
    },
    cssls = {capabilities = cssCapabilities},
    eslintls = eslintlsConfig
}

local M = {}

M.configs = configs

return M
