vim.g.NERDTreeWinPos = 'right'
vim.g.NERDTreeMinimalUI = 1

function Is_nerd_tree_open()
    return vim.t.NERDTreeBufName and vim.fn.bufwinnr(vim.t.NERDTreeBufName) ~= -1
end

function NerdTreeToggle()
    if not Is_nerd_tree_open() then -- We don't have a nerd tree buffer
        vim.cmd("NERDTree")-- Create a nerdtree
        vim.cmd("wincmd p")-- Focus the last window
        vim.cmd("NERDTreeFind")-- Try find the current file in nerdtree
        vim.cmd("NERDTreeFocus")-- Focus nerdtree incase the last command fails
    else -- We have a nerd tree buffer
        if vim.bo.filetype == "nerdtree" then
            vim.cmd("NERDTreeClose") -- Close nerdtree if it is the window we have focused
        else
            vim.cmd("NERDTreeFind")-- Try find the current file in nerdtree
            vim.cmd("NERDTreeFocus")-- Focus nerdtree incase the last command fails
        end
    end
end

vim.cmd("nnoremap <C-n> :lua require('sv.configs.nerdtree').NerdTreeToggle()<CR>")

-- " Start NERDTree when Vim starts with a directory argument.
vim.cmd("autocmd StdinReadPre * let s:std_in=1")
-- TODO: Clean up this line by making it into a lua function
vim.cmd(
    "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif")

-- Close NERDTree if it's the last window open
-- TODO: Clean up this line by making it into a lua function
vim.cmd(
    "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")

local M = {}

M.NerdTreeToggle = NerdTreeToggle

return M
