local cmp = require "cmp"

vim.opt.completeopt = {"menu", "menuone", "noselect"}

local lspkind = require "lspkind"
lspkind.init()

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(
            {behavior = cmp.SelectBehavior.Insert}),
        ['<C-p>'] = cmp.mapping.select_prev_item(
            {behavior = cmp.SelectBehavior.Insert}),
        ['<Down>'] = cmp.mapping.select_next_item(
            {behavior = cmp.SelectBehavior.Select}),
        ['<Up>'] = cmp.mapping.select_prev_item(
            {behavior = cmp.SelectBehavior.Select}),
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
        {name = "gh_issues"}, {name = 'nvim_lua'}, {name = 'zsh'},
        {name = 'nvim_lsp'}, {name = 'path'}, {name = 'vsnip'}, -- For vsnip users.
        {name = 'buffer'}
    }),
    experimental = {nativeMenu = false, ghost_text = true},
    format = require("lspkind").cmp_format(
        {
            with_text = true,
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]"
            })
        })
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})
