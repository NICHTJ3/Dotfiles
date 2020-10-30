" Coc highlight on cursorhold
autocmd! CursorHold * silent call CocActionAsync('highlight')
" Close coc-explorer if it's the last open window
autocmd! BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
