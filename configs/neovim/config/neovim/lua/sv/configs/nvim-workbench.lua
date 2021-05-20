vim.g.workbench_storage_path = os.getenv("HOME") .. "/Documents/Notes/"
-- " Below are my personal key mappings
-- " <Plug>ToggleProjectWorkbench let you toggle project specific workbench
vim.api.nvim_set_keymap('n', '<leader>bp', '<Plug>ToggleProjectWorkbench',{})
-- " <Plug>ToggleBranchWorkbench let you toggle the branch specific workbench
vim.api.nvim_set_keymap('n', '<leader>bb', '<Plug>ToggleBranchWorkbench',{})

-- " <Plug>WorkbenchToggleCheckbox allows you to add/toggle the checkbox
-- " - testing -> - [ ] testing
-- " - [ ] testing -> - [x] testing
-- " - [x] testing -> - [ ] testing
vim.api.nvim_set_keymap('n', '<leader><CR>', '<Plug>WorkbenchToggleCheckbox',{})
