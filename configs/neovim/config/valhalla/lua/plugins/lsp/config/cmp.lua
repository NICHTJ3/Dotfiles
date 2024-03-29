local M = {}

vim.opt.completeopt = { "menu", "menuone", "noselect" }

function M.setup()
    local cmp = require "cmp"
    local types = require "cmp.types"
    local luasnip = require "luasnip"
    local mapping = cmp.mapping

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end

    cmp.setup {
        formatting = {
            format = require("lspkind").cmp_format {
                with_text = true,
            },
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-d>"] = mapping(mapping.scroll_docs(8), { "i" }),
            ["<C-u>"] = mapping(mapping.scroll_docs(-8), { "i" }),
            ["<C-k>"] = mapping(function(fallback)
                if cmp.open_docs_preview() then
                    cmp.close()
                else
                    fallback()
                end
            end),
            ["<C-Space>"] = mapping.complete(),
            ["<C-e>"] = mapping.abort(),
            ["<CR>"] = mapping.confirm { select = false },
            ["<C-y>"] = cmp.mapping.confirm { select = false },
            ["<C-n>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    cmp.complete()
                end
            end, { "i", "c" }),
            ["<C-p>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    cmp.complete()
                end
            end, { "i", "c" }),
            ["<Tab>"] = mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item { behavior = types.cmp.SelectBehavior.Select }
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item { behavior = types.cmp.SelectBehavior.Select }
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
            { name = "tmux" },
            { name = "git" },
            { name = "calc" },
        },
        window = {
            documentation = {
                border = "rounded",
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            },
            completion = {
                border = "rounded",
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            },
        },
        experimental = {
            ghost_text_view = true,
            ghost_text = true,
        },
    }

    require("cmp_git").setup {
        enableRemoteUrlRewrites = true,
    }

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })
end

return M
