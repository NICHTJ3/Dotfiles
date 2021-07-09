-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                               neovim mappings                               "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
-- TODO: Check if the plugins exist before creating mappings for them?
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                              Window movement                                "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
-- Add windows
vim.api.nvim_set_keymap('n', '<leader>waj', ':split Below<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>wal', ':vsplit Right<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>wah', ':aboveleft vsp Left<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>wak', ':above split Above<CR>', {})

-- Close windows
vim.api.nvim_set_keymap('n', '<leader>wco', ':only<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>wca', ':qa<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>wcc', ':q<CR>', {})

-- Move windows
vim.api.nvim_set_keymap('n', '<leader>wmj', '<c-w>J', {})
vim.api.nvim_set_keymap('n', '<leader>wml', '<c-w>L', {})
vim.api.nvim_set_keymap('n', '<leader>wmh', '<c-w>H', {})
vim.api.nvim_set_keymap('n', '<leader>wmk', '<c-w>K', {})

-- Navigate windows
vim.api.nvim_set_keymap('n', '<leader>wnj', '<c-w>j', {})
vim.api.nvim_set_keymap('n', '<leader>wnl', '<c-w>l', {})
vim.api.nvim_set_keymap('n', '<leader>wnh', '<c-w>h', {})
vim.api.nvim_set_keymap('n', '<leader>wnk', '<c-w>k', {})

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                              markdown preview                               "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
-- TODO: Do this
-- nnoremap <silent> <leader>ac :<C-u>call CheckboxToggle()<CR>X<CR>

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                               Toggle spell                                  "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
vim.api.nvim_set_keymap('n', '<leader>as', ':set spell!<CR>', {})
