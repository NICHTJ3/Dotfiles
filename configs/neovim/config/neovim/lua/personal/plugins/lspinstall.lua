local eslint = {
    lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
    lintSource = 'eslint',
    lintStdin = true,
    lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'},
    lintIgnoreExitCode = true
}

-- local required_servers = {
--     "lua", -- "tailwindcss",
--     -- "typescript",
--     "graphql" -- "efm"
-- }
-- local installed_servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(required_servers) do
--     if not vim.tbl_contains(installed_servers, server) then
--         require'lspinstall'.install_server(server)
--     end
-- end

--- TODO: Break all this out into seporate files
--- TODO: Clean up file structure for all config
--- TODO: Setup prisma lsp
--

local servers_with_config = {
    lua = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';')
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'}
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                    }
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {enable = false}
            }
        }
    },
    efm = {
        on_attach = function(client)
            require('personal.plugins.lsp').common_on_attach(client, nil)
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
                javascript = {eslint},
                javascriptreact = {eslint},
                typescript = {eslint},
                typescriptreact = {eslint},
                svelte = {eslint}
                -- other languages here
            }
        }
    },
    graphql = {
        filetypes = {'typescriptreact', 'typescript', 'javascript', 'svelte'},
        root_dir = require('lspconfig').util.root_pattern("yarn.lock",
                                                          "lerna.json",
                                                          "package-lock.json",
                                                          ".git")
    }
}

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        if servers_with_config[server] == nil then
            require'lspconfig'[server].setup {
                on_attach = require('personal.plugins.lsp').common_on_attach
            }
        else
            local server_config = servers_with_config[server]
            require'lspconfig'[server].setup {
                on_attach = server_config.on_attach or
                    require('personal.plugins.lsp').common_on_attach,
                settings = server_config.settings or nil,
                filetypes = server_config.filetypes or nil,
                root_dir = server_config.root_dir or nil
            }
        end
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
