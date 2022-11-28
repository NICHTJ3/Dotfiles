-- --------------- -----
-- Default options -----
-- --------------- -----
vim.o.background = "dark"

-- Black line numbers and signcolumn
vim.cmd [[ hi! LineNr guibg=0 ]]
vim.cmd [[ hi! GitGutterAdd guibg=0 ]]
vim.cmd [[ hi! GitGutterChange guibg=0 ]]
vim.cmd [[ hi! GitGutterDelete guibg=0 ]]
vim.cmd [[ hi! SignColumn guibg=0 ]]

-- Make ColorColumn the same color as cursorline
vim.cmd [[ hi! link ColorColumn CursorLine ]]

-- ------ -----
-- Themes -----
-- ------ -----
-- NOTE: To best make use of these themes you should use the iterm themes too
local themes = {
    catppuccin = function()
        vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
        vim.cmd [[packadd catppuccin]]
        local ok, catppuccin = pcall(require, "catppuccin")

        if not ok then
            print "The Catppuccin theme is not installed"
        end

        catppuccin.setup {
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            integrations = {
                treesitter = true,
                gitsigns = true,
                treesitter_context = true,
                neotree = {
                    enabled = true,
                    show_root = true,
                    transparent_panel = true,
                },
                ts_rainbow = true,
            },
        }
        vim.cmd [[ silent! colorscheme catppuccin ]]
    end,

    kanagawa = function()
        vim.cmd [[packadd kanagawa.nvim]]
        vim.cmd [[ silent! colorscheme kanagawa ]]
    end,

    onedark_darker = function()
        vim.cmd [[packadd onedark.nvim]]

        local ok, onedark = pcall(require, "onedark")
        if not ok then
            print "The Onedark theme is not installed"
        end
        onedark.setup {
            style = "darker",
        }
        onedark.load()
    end,

    onedark_warm = function()
        vim.cmd [[packadd onedark.nvim]]
        local ok, onedark = pcall(require, "onedark")
        if not ok then
            print "The Onedark theme is not installed"
        end
        onedark.setup {
            style = "warmer",
        }
        onedark.load()
    end,

    nebulous = function()
        vim.cmd [[packadd nebulous.nvim]]
        local ok, nebulous = pcall(require, "nebulous")
        if not ok then
            print "The Nebulous theme is not installed"
        end

        nebulous.setup {
            variant = "midnight",
            italic = {
                comments = false,
                keywords = true,
                functions = false,
                variables = true,
            },
        }
        vim.keymap.set("n", "<leader>ts", require("nebulous.functions").toggle_variant)
    end,

    tokyonight_night = function()
        vim.cmd [[packadd tokyonight.nvim]]
        vim.g.tokyonight_style = "night"
        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }
        vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
        vim.cmd [[ silent! colorscheme tokyonight ]]
    end,
}

themes.catppuccin()
