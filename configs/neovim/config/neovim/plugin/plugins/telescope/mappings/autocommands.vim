" Open Files instead of explor
" autocmd! StdinReadPre * let s:std_in=1
" TODO: Make this work
" autocmd! VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |exe 'ene'| exe 'lua Telescope find_files' argv()[0] | endif
