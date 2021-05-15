local prettier = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

local rustfmt = function()
    return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
end

local gofmt = function() return {exe = "gofumpt", stdin = true} end

local luaformat = function() return {exe = "lua-format -i", stdin = true} end

require("formatter").setup({
    logging = false,
    filetype = {
        typescriptreact = {prettier},
        javascript = {prettier},
        typescript = {prettier},
        svelte = {prettier},
        css = {prettier},
        jsonc = {prettier},
        json = {prettier},
        html = {prettier},
        php = {prettier},
        rust = {rustfmt},
        go = {gofmt},
        lua = {luaformat}
    }
})

vim.cmd('nnoremap <leader>d <Cmd>Format<CR>')
