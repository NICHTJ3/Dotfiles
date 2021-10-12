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
    graphql = {
        cmd = {"graphql-lsp", "server", "-m", "stream"},
        on_new_config = function(new_config, new_root_dir)
            local new_cmd = vim.deepcopy(
                                {"graphql-lsp", "server", "-m", "stream"})
            table.insert(new_cmd, '-c')
            table.insert(new_cmd, new_root_dir)
            new_config.cmd = new_cmd
        end,
        filetypes = {
            'typescriptreact', 'typescript', 'graphql', 'typescript.tsx'
        },
        root_dir = require('lspconfig').util.root_pattern('.graphqlrc',
                                                          '.graphqlrc.json',
                                                          '.graphqlrc.yml',
                                                          '.graphqlrc.yaml',
                                                          '.graphql.config.js',
                                                          '.graphqlrc.js',
                                                          'package.json',
                                                          'tsconfig.json',
                                                          '.git')
    },
    typescript = {
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
    tailwindcss = {
        -- TODO: Add support for base filetypes
        filetypes = {
            'typescriptreact', 'typescript.tsx', 'javascriptreact',
            'javascript.jsx'
        }
    },
    css = {capabilities = cssCapabilities}
}

local M = {}

M.configs = configs

return M
