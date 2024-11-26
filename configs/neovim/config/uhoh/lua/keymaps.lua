-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
vim.keymap.set('n', '<leader>ur', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', { desc = 'Redraw / Clear hlsearch / Diff Update' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- Toggle lsp inlay hints
if vim.lsp.inlay_hint then
  Core.toggle.map('<leader>uh', Core.toggle.inlay_hints)
end

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands

--  Use CTRL+<hjkl> to switch between windows if we don't have vim-tmux-navigator installed
if not Core.has 'vim-tmux-navigator' then
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end

-- Keybinds to make adding new windows nicer.
--  Use <leader>+wa+<hjkl> to add new windows
vim.keymap.set('n', '<leader>waj', ':new<CR>', { desc = 'new window below' })
vim.keymap.set('n', '<leader>wal', ':vnew<CR>', { desc = 'new window to the right' })
vim.keymap.set('n', '<leader>wah', ':aboveleft vnew<CR>', { desc = 'new window to the left' })
vim.keymap.set('n', '<leader>wak', ':above new<CR>', { desc = 'new window above' })

-- Moving lines with < and > in visual mode doesn't unselect the text
vim.keymap.set('x', '<', '<gv', { desc = 'Move selected lines left' })
vim.keymap.set('x', '>', '>gv', { desc = 'Move selected lines right' })

-- Keep cursor centered when scrolling with <C-d> and <C-u>
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
--
-- vim: ts=2 sts=2 sw=2 et
