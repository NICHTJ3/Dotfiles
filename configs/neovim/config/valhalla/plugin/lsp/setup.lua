local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
    print "Oh no"
    return
end

local util = require "lspconfig.util"
local cmp_lsp = require "cmp_nvim_lsp"

---@param opts table|nil
local function create_capabilities(opts)
    local default_opts = {
        with_snippet_support = true,
    }
    opts = opts or default_opts
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = opts.with_snippet_support
    if opts.with_snippet_support then
        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        }
    end
    return cmp_lsp.update_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
    if config.on_attach then
        config.on_attach = util.add_hook_after(config.on_attach, require "valhalla.lsp.on-attach")
    else
        config.on_attach = require "valhalla.lsp.on-attach"
    end
    config.capabilities = create_capabilities()
end)

local mason_ok, mason = pcall(require, "mason-lspconfig")
if not mason_ok then
    return
end

mason.setup {}

mason.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {}
    end,
    ["jdtls"] = function()
        local function progress_handler()
            ---@type table<string, boolean>
            local tokens = {}
            ---@type table<string, boolean>
            local ready_projects = {}
            ---@param result {type:"Starting"|"Started"|"ServiceReady", message:string}
            return function(_, result, ctx)
                local cwd = vim.loop.cwd()
                if ready_projects[cwd] then
                    return
                end
                local token = tokens[cwd] or vim.tbl_count(tokens)
                if result.type == "Starting" and not tokens[cwd] then
                    tokens[cwd] = token
                    vim.lsp.handlers["$/progress"](nil, {
                        token = token,
                        value = {
                            kind = "begin",
                            title = "jdtls",
                            message = result.message,
                            percentage = 0,
                        },
                    }, ctx)
                elseif result.type == "Starting" then
                    local _, percentage_index = string.find(result.message, "^%d%d?%d?")
                    local percentage = 0
                    local message = result.message
                    if percentage_index then
                        ---@diagnostic disable-next-line: cast-local-type
                        percentage = tonumber(string.sub(result.message, 1, percentage_index))
                        message = string.sub(result.message, percentage_index + 3)
                    end

                    vim.lsp.handlers["$/progress"](nil, {
                        token = token,
                        value = {
                            kind = "report",
                            message = message,
                            percentage = percentage,
                        },
                    }, ctx)
                elseif result.type == "Started" then
                    vim.lsp.handlers["$/progress"](nil, {
                        token = token,
                        value = {
                            kind = "report",
                            message = result.message,
                            percentage = 100,
                        },
                    }, ctx)
                elseif result.type == "ServiceReady" then
                    ready_projects[cwd] = true
                    vim.lsp.handlers["$/progress"](nil, {
                        token = token,
                        value = {
                            kind = "end",
                            message = result.message,
                        },
                    }, ctx)
                end
            end
        end

        lspconfig.jdtls.setup {
            use_lombok_agent = true,
            handlers = {
                ["language/status"] = progress_handler,
            },
        }
    end,
    ["jsonls"] = function()
        lspconfig.jsonls.setup {
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                },
            },
        }
    end,
    ["rust_analyzer"] = function()
        require("rust-tools").setup {
            tools = {
                executor = require("rust-tools/executors").toggleterm,
                hover_actions = { border = "solid" },
            },
        }
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup(require("lua-dev").setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "P" },
                    },
                },
            },
        })
    end,
    ["eslint"] = function()
        local get_cmd = require("valhalla.utils").get_cmd
        local eslint_config = require "lspconfig.server_configurations.eslint"
        local cmd = eslint_config.default_config.cmd
        lspconfig.eslint.setup {
            on_new_config = function(config, new_root_dir)
                eslint_config.default_config.on_new_config(config, new_root_dir)
                config.cmd = get_cmd(cmd)
            end,
        }
    end,
    ["yamlls"] = function()
        lspconfig.yamlls.setup {
            settings = {
                yaml = {
                    hover = true,
                    completion = true,
                    validate = true,
                    schemas = require("schemastore").json.schemas(),
                },
            },
        }
    end,
    ["tsserver"] = function()
        local on_attach = require "valhalla.configs.lsp.on-attach"
        local get_cmd = require("valhalla.utils").get_cmd
        print "Yes it is"

        local function organize_imports()
            local params = {
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(0) },
                title = "",
            }
            vim.lsp.buf.execute_command(params)
        end

        local tsserver_config = require "lspconfig.server_configurations.tsserver"
        local cmd = get_cmd(tsserver_config.default_config.cmd)

        lspconfig.tsserver.setup {
            cmd = cmd,
            filetypes = {
                "typescriptreact",
                "typescript",
                "typescript.tsx",
                "javascript",
                "javascriptreact",
            },
            commands = {
                OrganizeImports = { organize_imports, description = "Organize Imports" },
            },
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                on_attach(client, bufnr)
            end,
        }
    end,
}