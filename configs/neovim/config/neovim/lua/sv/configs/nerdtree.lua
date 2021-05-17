vim.g.NERDTreeWinPos = 'right'
vim.g.NERDTreeMinimalUI = 1

vim.cmd("nnoremap <leader>n :NERDTreeFocus<CR>")
-- vim.cmd("nnoremap <C-n> :NERDTreeToggle<CR>")

function IsNerdTreeEnabled()
    return vim.t.NERDTreeBufName and vim.fn.bufwinnr(vim.t.NERDTreeBufName) ~= -1
end

function NerdTreeToggle()
    if not IsNerdTreeEnabled() then -- We don't have a nerd tree buffer
        vim.cmd("NERDTree")
        vim.cmd("wincmd p")
        vim.cmd("NERDTreeFind")
        vim.cmd("NERDTreeFocus")
    else -- We have a nerd tree buffer
        if vim.bo.filetype == "nerdtree" then
            vim.cmd("NERDTreeClose")
        else
            vim.cmd("NERDTreeFind")
            vim.cmd("NERDTreeFocus")
        end
    end
end

vim.cmd(
    "nnoremap <C-n> :lua require('sv.configs.nerdtree').NerdTreeToggle()<CR>")

vim.cmd("nnoremap <leader>f :NERDTreeFind<CR>")

-- TODO: Smarter mappings like open and forcus current file

-- " Start NERDTree when Vim starts with a directory argument.
-- TODO: Clean up this line
vim.cmd("autocmd StdinReadPre * let s:std_in=1")
vim.cmd(
    "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif")

-- Close NERDTree if it's the last window open
-- TODO: Clean up this line
vim.cmd(
    "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")

local M = {}

M.NerdTreeToggle = NerdTreeToggle

return M
