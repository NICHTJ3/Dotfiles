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
        vim.cmd [[ silent! colorscheme catppuccin ]]
    end,
    kanagawa = function()
        vim.cmd [[ silent! colorscheme kanagawa ]]
    end,

    onedark = function()
        require("onedark").setup {
            style = "deep",
        }
        require("onedark").load()
    end,

    minimal = function()
        vim.cmd [[ silent! colorscheme minimal ]]
    end,

    nebulous = function()
        require("nebulous").setup {
            variant = "night",
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
        vim.g.tokyonight_style = "night"
        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }
        vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
        vim.cmd [[ silent! colorscheme tokyonight ]]
    end,
}

themes.tokyonight_night()
