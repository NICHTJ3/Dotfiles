" Open FZF instead of explor
autocmd! StdinReadPre * let s:std_in=1
autocmd! VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |exe 'ene'| exe 'Files' argv()[0] | endif
