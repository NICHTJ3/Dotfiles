vim.g.NERDTreeWinPos = 'right'
vim.g.NERDTreeMinimalUI = 1

vim.cmd("nnoremap <leader>n :NERDTreeFocus<CR>")
vim.cmd("nnoremap <C-n> :NERDTreeToggle<CR>")
vim.cmd("nnoremap <leader>f :NERDTreeFind<CR>")
-- TODO: Smarter mappings like open 

-- " Start NERDTree when Vim starts with a directory argument.
-- TODO: Clean up this line
vim.cmd("autocmd StdinReadPre * let s:std_in=1")
vim.cmd(
    "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif")

-- Close NERDTree if it's the last window open
-- TODO: Clean up this line
vim.cmd(
    "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")
