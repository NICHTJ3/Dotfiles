local configs = require('sv.configs.lsp.lspconfig').configs
local common_on_attach = require('sv.configs.lsp').common_on_attach

local required_servers = {"lua", "tailwindcss", "typescript", "efm"}
local installed_servers = require'lspinstall'.installed_servers()
for _, server in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, server) then
        require'lspinstall'.install_server(server)
    end
end

--- TODO: Setup prisma lsp

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()

    -- TODO: Extract this functionality to a better place
    table.insert(servers, "graphql")

    for _, server in pairs(servers) do
        local server_config = configs[server] or {}
        require'lspconfig'[server].setup {
            on_attach = server_config.on_attach or common_on_attach,
            settings = server_config.settings or nil,
            filetypes = server_config.filetypes or nil,
            root_dir = server_config.root_dir or nil,
            capabilities = server_config.capabilities or nil,
            bundle_path = server_config.bundle_path or nil,
            cmd = server_config.cmd or nil,
            commands = server_config.commands or nil
        }
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
