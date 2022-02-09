-- Change instances of word undercursor
vim.keymap.set('n', 'c*', '*Ncgn', {noremap = true})

-- Y yanks to end of line like it should
vim.keymap.set('n', 'Y', 'y$', {noremap = true})

-- Maximise splits
vim.keymap.set('n', '|', '<C-w>|', {noremap = true})
vim.keymap.set('n', '_', '<C-w>_', {noremap = true})

-- Resize with arrow keys and ctrl
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -5<CR>', {noremap = true})
vim.keymap
    .set('n', '<C-Right>', '<cmd>vertical resize +5<CR>', {noremap = true})
vim.keymap.set('n', '<C-Down>', '<cmd>resize -5<CR>', {noremap = true})
vim.keymap.set('n', '<C-Up>', '<cmd>resize +5<CR>', {noremap = true})

-- Quickfix navigation
vim.keymap.set('n', '<Down>', '<cmd>cnext<CR>', {noremap = true})
vim.keymap.set('n', '<Up>', '<cmd>cprev<CR>', {noremap = true})

-- Search duck duck go with gs
vim.keymap.set('n', 'gs', ':set opfunc=DuckIt<CR>g@', {silent = true})
