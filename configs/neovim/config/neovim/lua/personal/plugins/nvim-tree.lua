local g = vim.g

g.nvim_tree_side = 'right'
g.nvim_tree_follow = 1
g.nvim_tree_tab_open = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
g.nvim_tree_auto_ignore_ft = {'dashboard'} -- empty by default, don't auto open tree on specific filetypes.
g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = ""
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}

vim.cmd('nnoremap <c-n> <Cmd>NvimTreeToggle<CR>')

