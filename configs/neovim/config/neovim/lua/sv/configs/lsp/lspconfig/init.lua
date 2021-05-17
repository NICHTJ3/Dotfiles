local efmConfig = require('sv.configs.lsp.lspconfig.efm').config

local configs = {
    efm = efmConfig,
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
    -- TODO: This doesn't seam to work in iou for some reason -_-
    graphql = {
        cmd = {"graphql-lsp", "server", "-m", "stream"},
        filetypes = {'typescriptreact', 'typescript', 'graphql'},
        root_dir = require('lspconfig').util.root_pattern('.graphqlrc',
                                                          '.graphqlrc.json',
                                                          '.graphqlrc.yml',
                                                          '.graphqlrc.yaml',
                                                          '.graphql.config.js',
                                                          '.graphqlrc.js',
                                                          'package.json',
                                                          'tsconfig.json',
                                                          '.git')
    }
}

local M = {}

M.configs = configs

return M