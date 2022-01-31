-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                               neovim mappings                               "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
-- TODO: Check if the plugins exist before creating mappings for them?
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                              Window movement                                "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
-- Add windows
vim.keymap.set('n', '<leader>waj', ':split Below<CR>')
vim.keymap.set('n', '<leader>wal', ':vsplit Right<CR>')
vim.keymap.set('n', '<leader>wah', ':aboveleft vsp Left<CR>')
vim.keymap.set('n', '<leader>wak', ':above split Above<CR>')

-- Close windows
vim.keymap.set('n', '<leader>wco', ':only<CR>')
vim.keymap.set('n', '<leader>wca', ':qa<CR>')
vim.keymap.set('n', '<leader>wcc', ':q<CR>')

-- Move windows
vim.keymap.set('n', '<leader>wmj', '<c-w>J')
vim.keymap.set('n', '<leader>wml', '<c-w>L')
vim.keymap.set('n', '<leader>wmh', '<c-w>H')
vim.keymap.set('n', '<leader>wmk', '<c-w>K')

-- Navigate windows
vim.keymap.set('n', '<leader>wnj', '<c-w>j')
vim.keymap.set('n', '<leader>wnl', '<c-w>l')
vim.keymap.set('n', '<leader>wnh', '<c-w>h')
vim.keymap.set('n', '<leader>wnk', '<c-w>k')

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                               Toggle spell                                  "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
vim.keymap.set('n', '<leader>as', ':set spell!<CR>')
