local utils = require('valhalla.lsp.lspconfig.utils')

local eslintlsConfig = require("valhalla.lsp.lspconfig.eslintls").config
local csslsConfig = require("valhalla.lsp.lspconfig.cssls").config

vim.fn.sign_define("LspDiagnosticsSignError", {
    texthl = "LspDiagnosticsSignError",
    text = "",
    numhl = "LspDiagnosticsSignError"
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
    texthl = "LspDiagnosticsSignWarning",
    text = "",
    numhl = "LspDiagnosticsSignWarning"
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
    texthl = "LspDiagnosticsSignHint",
    text = "",
    numhl = "LspDiagnosticsSignHint"
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
    texthl = "LspDiagnosticsSignInformation",
    text = "",
    numhl = "LspDiagnosticsSignInformation"
})

-- Set Default Prefix.
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {prefix = "", spacing = 0},
        -- virtual_text = false,
        signs = true,
        underline = true
    })

local M = {}

M.configs = {
    tsserver = {
        filetypes = {
            'typescriptreact', 'typescript', 'typescript.tsx', 'javascript',
            'javascriptreact'
        },
        commands = {
            OrganizeImports = {
                function()
                    local params = {
                        command = "_typescript.organizeImports",
                        arguments = {vim.api.nvim_buf_get_name(0)},
                        title = ""
                    }
                    vim.lsp.buf.execute_command(params)
                end,
                description = "Organize Imports"
            }
        },
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            utils.common_on_attach(client, bufnr)
        end

    },
    cssls = csslsConfig,
    eslint = eslintlsConfig
}

M.common_on_attach = utils.common_on_attach

return M
