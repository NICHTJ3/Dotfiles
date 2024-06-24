-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keybinds to make adding new windows easier.
--  Use <leader>+wa+<hjkl> to add new windows
vim.keymap.set('n', '<leader>waj', ':new<CR>', { desc = 'new window below' })
vim.keymap.set('n', '<leader>wal', ':vnew<CR>', { desc = 'new window to the right' })
vim.keymap.set('n', '<leader>wah', ':aboveleft vnew<CR>', { desc = 'new window to the left' })
vim.keymap.set('n', '<leader>wak', ':above new<CR>', { desc = 'new window above' })

-- JK move lines in visual mode
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", { desc = 'Move selected lines up' })
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", { desc = 'Move selected lines down' })

-- Moving lines with < and > in visual mode doesn't unselect the text
vim.keymap.set('x', '<', '<gv', { desc = 'Move selected lines left' })
vim.keymap.set('x', '>', '>gv', { desc = 'Move selected lines right' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Keep cursor centered when scrolling with <C-d> and <C-u>
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- vim: ts=2 sts=2 sw=2 et
