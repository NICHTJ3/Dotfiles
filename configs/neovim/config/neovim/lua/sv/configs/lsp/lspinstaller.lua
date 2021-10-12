local configurations = require('sv.configs.lsp.lspconfig').configs
local common_on_attach = require('sv.configs.lsp').common_on_attach

local required_servers = {
    "omnisharp", "dockerls", "emmet_ls", "cssls", "graphql", "jsonls",
    "prismals", "eslintls", "tsserver", "vimls", "tailwindcss", "html",
    "stylelint_lsp", "svelte", "rust_analyzer", "sumneko_lua", "vuels", "bashls"

}

local lsp_installer_servers = require 'nvim-lsp-installer.servers'

for _, server in pairs(required_servers) do
    local ok, server_to_check = lsp_installer_servers.get_server(server)
    if ok then
        if not server_to_check:is_installed() then
            server_to_check:install()
        end
    end
end

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local server_config = configurations[server.name] or {}
    server_config.on_attach = server_config.on_attach or common_on_attach

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(server_config)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
