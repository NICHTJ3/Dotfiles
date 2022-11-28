local function file_size_too_large(lang, buf)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
        return true
    end
end

local function file_too_long(lang, buf)
    return vim.api.nvim_buf_line_count(buf) > 5000
end

local M = {}

M.setup = function()
    require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        ignore_install = { "haskell", "phpdoc" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = function(lang, bufnr)
                return file_size_too_large(lang, bufnr) or file_too_long(lang, bufnr)
            end,
        },
        indent = { enable = true, disable = { "python", "yaml", "tsx" } },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<S-Tab>", -- normal mode (Can't be <Tab> as tab is also <C-I>)
                node_incremental = "<Tab>", -- visual mode
                node_decremental = "<S-Tab>", -- visual mode
            },
        },
        -- extensions
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                },
            },
        },
        autotag = {
            enable = true,
            filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
        },
        rainbow = { enable = true, extended_mode = false },
        context_commentstring = {
            enable = true,
            config = {
                javascriptreact = { style_element = "{/*%s*/}" },
                typescriptreact = { style_element = "{/*%s*/}" },
            },
        },
        matchup = {
            enable = true,
        },
    }

    require("treesitter-context").setup {
        enable = true,
    }
end

return M
