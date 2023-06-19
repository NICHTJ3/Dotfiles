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

return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            {
                "nvim-treesitter/playground",                  -- Debug treesitter
                "nvim-treesitter/nvim-treesitter-context",     -- Show context at the top of the screen while scrolling
                "p00f/nvim-ts-rainbow",                        -- Rainbow brackets
                "JoosepAlviste/nvim-ts-context-commentstring", -- Better commenting in tsx/jsx
                "windwp/nvim-ts-autotag",                      -- Auto rename closing tags in html/jsx
                "nvim-treesitter/nvim-treesitter-textobjects", -- Change inner function etc...
                init = function()
                    -- PERF: no need to load the plugin, if we only need its queries for mini.ai
                    local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
                    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
                    local enabled = false
                    if opts.textobjects then
                        for _, mod in ipairs { "move", "select", "swap", "lsp_interop" } do
                            if opts.textobjects[mod] and opts.textobjects[mod].enable then
                                enabled = true
                                break
                            end
                        end
                    end
                    if not enabled then
                        require("lazy.core.loader").disable_rtp_plugin "nvim-treesitter-textobjects"
                    end
                end,
            },
        },
        keys = {
            {
                "<c-space>",
                desc = "Increment selection",
            },
            {
                "<bs>",
                desc = "Decrement selection",
                mode = "x",
            },
        },
        ---@type TSConfig
        opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = function(lang, bufnr)
                    return file_size_too_large(lang, bufnr) or file_too_long(lang, bufnr)
                end,
            },
            indent = {
                enable = true,
                disable = { "python", "yaml", "tsx" },
            },
            ensure_installed = {
                "bash",
                "c",
                "html",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            playground = {
                enable = true,
                disable = {},
                updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<S-Tab>",   -- normal mode (Can't be <Tab> as tab is also <C-I>)
                    node_incremental = "<Tab>",   -- visual mode
                    node_decremental = "<S-Tab>", -- visual mode
                },
            },
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
            rainbow = {
                enable = true,
                extended_mode = false,
            },
            context_commentstring = {
                enable = true,
                config = {
                    javascriptreact = {
                        style_element = "{/*%s*/}",
                    },
                    typescriptreact = {
                        style_element = "{/*%s*/}",
                    },
                },
            },
            matchup = {
                enable = true,
            },
        },
        ---@param opts TSConfig
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
