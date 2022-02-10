-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                                 Git                                          "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
-- Git rebase file mappings
if vim.fn.expand('%:t') == "git-rebase-todo" then
    vim.keymap.set('n', 'p', '0ciwpick<ESC>0', {noremap = true})
    vim.keymap.set('n', 'r', '0ciwreword<ESC>0', {noremap = true})
    vim.keymap.set('n', 'e', '0ciwedit<ESC>0', {noremap = true})
    vim.keymap.set('n', 's', '0ciwsquash<ESC>0', {noremap = true})
    vim.keymap.set('n', 'f', '0ciwfixup<ESC>0', {noremap = true})
    vim.keymap.set('n', 'x', '0ciwexec<ESC>0', {noremap = true})
    vim.keymap.set('n', 'd', '0ciwdrop<ESC>0', {noremap = true})
end

-- Open git status
vim.keymap
    .set('n', '<leader>ags', "<cmd>G<CR>", {silent = true, noremap = true})
