vim.o.background = 'dark'

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
