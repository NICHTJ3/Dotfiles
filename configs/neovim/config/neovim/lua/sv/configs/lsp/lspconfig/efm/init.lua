local linters = require('sv.configs.lsp.lspconfig.efm.linters')

local config ={
  on_attach = function(client)
            require('sv.plugins.lsp').common_on_attach(client, nil)
            client.resolved_capabilities.rename = false
            client.resolved_capabilities.hover = false
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.completion = false
        end,
        root_dir = require('lspconfig').util.root_pattern("yarn.lock",
                                                          "lerna.json",
                                                          "package-lock.json",
                                                          "lerna.json", ".git"),
        filetypes = {
            'typescriptreact', 'typescript', 'javascript', 'javascriptreact',
            'svelte'
        },
        settings = {
            languages = {
                javascript = {linters.eslint},
                javascriptreact = {linters.eslint},
                typescript = {linters.eslint},
                typescriptreact = {linters.eslint},
                svelte = {linters.eslint}
                -- other languages here
            }
        }}

local M = {
}

M.config = config
return M