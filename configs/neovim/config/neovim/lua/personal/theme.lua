vim.o.background = 'dark'

-- iterm colors for tokyonight:
-- https://github.com/folke/tokyonight.nvim/tree/main/extras
local function tokyonight()
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_italic_functions = 1
    vim.g.tokyonight_sidebars = {
        "qf", "vista_kind", "terminal", "packer", "coc-explorer", "vim-plug",
        "nerdtree", "NvimTree"
    }
    vim.g.tokyonight_hide_inactive_statusline = 1
    vim.g.tokyonight_dark_sidebar = 1
    vim.g.tokyonight_dark_float = 1
    vim.g.tokyonight_italic_comments = 1
    vim.g.tokyonight_transparent = 1

    vim.cmd('silent! colorscheme tokyonight')
end

-- iterm colors for kanagawa:
-- https://github.com/rebelot/kanagawa.nvim/blob/master/extras
local function kanagawa() vim.cmd('silent! colorscheme kanagawa') end

local function catppuccin() vim.cmd('silent! colorscheme catppuccin') end

-- Black line numbers and signcolumn
vim.cmd('hi! LineNr guibg=0')
vim.cmd('hi! GitGutterAdd guibg=0')
vim.cmd('hi! GitGutterChange guibg=0')
vim.cmd('hi! GitGutterDelete guibg=0')
vim.cmd('hi! SignColumn guibg=0')

-- Make ColorColumn the same color as cursorline
vim.cmd('hi! link ColorColumn CursorLine')

catppuccin()
