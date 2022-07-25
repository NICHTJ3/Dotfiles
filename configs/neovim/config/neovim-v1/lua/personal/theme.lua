vim.o.background = 'dark'

-- NOTE: To best make use of these themes you should use the iterm themes too
local themes = {}
themes.catppuccin = function() vim.cmd('silent! colorscheme catppuccin') end

themes.kanagawa = function() vim.cmd('silent! colorscheme kanagawa') end

themes.tokyonight = function()
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }
    vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
    vim.cmd('silent! colorscheme tokyonight')
end

-- Black line numbers and signcolumn
vim.cmd('hi! LineNr guibg=0')
vim.cmd('hi! GitGutterAdd guibg=0')
vim.cmd('hi! GitGutterChange guibg=0')
vim.cmd('hi! GitGutterDelete guibg=0')
vim.cmd('hi! SignColumn guibg=0')

-- Make ColorColumn the same color as cursorline
vim.cmd('hi! link ColorColumn CursorLine')

themes.tokyonight();
