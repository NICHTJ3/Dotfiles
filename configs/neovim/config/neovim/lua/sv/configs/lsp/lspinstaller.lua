local common_on_attach = require('sv.configs.lsp').common_on_attach
local configurations = require('sv.configs.lsp.lspconfig').configs
local lsp_installer = require("nvim-lsp-installer")
local lsp_status = require('lsp-status')

lsp_status.config({
    indicator_errors = 'E',
    indicator_warnings = 'W',
    indicator_info = 'i',
    indicator_hint = '?',
    indicator_ok = 'Ok',
    kind_labels = vim.g.completion_customize_lsp_label,
    diagnostics = false
})
lsp_status.register_progress()

lsp_installer.on_server_ready(function(server)
    local server_config = configurations[server.name] or {}
    server_config.on_attach = server_config.on_attach or common_on_attach
    server_config.capabilities = vim.tbl_extend('keep',
                                                server_config.capabilities or {},
                                                lsp_status.capabilities)

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(server_config)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
