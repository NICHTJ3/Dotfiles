local cmp = require "cmp"

vim.opt.completeopt = {"menu", "menuone", "noselect"}

require('lspconfig').util.default_config.capabilities =
    require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities())

cmp.setup {
    completion = {completeopt = 'menu,menuone,noinsert'},
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end
    },
    mapping = {
        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item()
            else
                cmp.complete()
            end
        end, {'i', 'c'}),
        ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            else
                cmp.complete()
            end
        end, {'i', 'c'}),
        ['<Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item()
            else
                cmp.complete()
            end
        end, {'i', 'c'}),
        ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            else
                cmp.complete()
            end
        end, {'i', 'c'}),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        })
    },
    sources = cmp.config.sources({
        {name = 'vsnip'}, -- For vsnip users.
        {name = 'nvim_lsp'}, {name = 'nvim_lua'}, {name = 'path'},
        {name = 'zsh'},
        {
            name = 'look',
            keyword_length = 2,
            opts = {convert_case = true, loud = true}
        }, {name = 'buffer'}

    }),

    experimental = {nativeMenu = false, ghost_text = true},
    formatting = {
        format = require("lspkind").cmp_format(
            {
                with_text = false,
                menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    path = "[Path]",
                    cmdline = "[Command]",
                    latex_symbols = "[Latex]",
                    vsnip = "[Snippet]"
                })
            })
    }
}

-- Use buffer source for `/`.
require'cmp'.setup.cmdline('/', {
    sources = cmp.config.sources({{name = 'nvim_lsp_document_symbol'}},
                                 {{name = 'buffer'}})
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})
