local cmp = require "cmp"

vim.opt.completeopt = {"menu", "menuone", "noselect"}

local keymap = require("cmp.utils.keymap")

cmp.setup {
    -- completion = {completeopt = 'menu,menuone,noinsert'},
    completion = {autocomplete = {cmp.TriggerEvent.TextChanged}},
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
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            -- TODO: Do I need check_backspace to be used here
            -- FIXME: This has issues. I.E trying to complete form at for would
            -- complete a for loop
            if vim.fn["vsnip#available"]() == 1 then
                vim.fn.feedkeys(keymap.t("<Plug>(vsnip-expand-or-jump)"), "")
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback() -- The fallback function is treated as original mapped key. In this case, it might be `<Tab>`.
            end
        end, {'i', 's'}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if vim.fn["vsnip#available"]() == 1 then
                vim.fn.feedkeys(keymap.t("<Plug>(vsnip-jump-prev)"), "")
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        })
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'nvim_lua'}, {name = 'vsnip'}, -- For vsnip users.
        {name = 'path'}, {name = 'zsh'},
        {
            name = 'look',
            keyword_length = 2,
            opts = {convert_case = true, loud = true}
        }, {name = 'buffer'}, {name = "cmp_git"}

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

require("cmp_git").setup()

-- Use buffer source for `/`.
require'cmp'.setup.cmdline('/', {
    sources = cmp.config.sources({{name = 'nvim_lsp_document_symbol'}},
                                 {{name = 'buffer'}})
})

-- TODO: Is there a way to autocomplete on enter?
-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})
