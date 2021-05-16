local g = vim.g

g.nvim_tree_side = 'right'
g.nvim_tree_follow = 1
g.nvim_tree_tab_open = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1

vim.cmd('nnoremap <c-n> <Cmd>NvimTreeToggle<CR>')
