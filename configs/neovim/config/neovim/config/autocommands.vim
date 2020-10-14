"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                              Neovim AutoCommands                             "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
if has("autocmd")
  augroup SourceVimrcOnSave
    autocmd!
    autocmd BufWritepost *.vim source $MYVIMRC
  augroup END

  augroup CustomSyntax
    autocmd!
    autocmd BufWinEnter *.kotlin set filetype=kotlin
    autocmd BufWinEnter *.vue set syntax=vue
    autocmd BufWinEnter *.qrc set filetype=xml
    autocmd BufWinEnter config set syntax=i3config
    autocmd BufWinEnter *.pug set syntax=pug
    autocmd BufWinEnter *.cisco set syntax=cisco
    autocmd BufWinEnter *.css set filetype=css
    autocmd Filetype vimwiki set foldlevel=2
  augroup END

  augroup Indentation
    autocmd!
    autocmd FileType cs set sw=4 ts=4 sts=4
    autocmd FileType cucumber set sw=2 ts=2 sts=2 noet
    autocmd BufWinEnter *.ipynb set sw=4 ts=4 sts=4 et
    autocmd BufWinEnter *.py set sw=4 ts=4 sts=4 et
  augroup end

  augroup Folding
    autocmd!
    autocmd FileType cs setlocal foldmethod=indent
    autocmd FileType vim setlocal foldmethod=marker
  augroup end

  augroup Terminal
    autocmd!
    autocmd TermOpen * startinsert
    " Turn off line numbers etc
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber
  augroup end

  augroup FileTypeBindings
    autocmd!
    autocmd FileType fzf tnoremap <buffer> <c-h> <c-x> " Open in vertical split
    autocmd FileType fzf tnoremap <buffer> <esc> <c-c> " Close fzf with escape
    autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
    autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
  augroup end

  " Color all columns past 81
  autocmd! Filetype * let &l:colorcolumn='+' . join(range(1, 254), ',+')
  " Coc highlight on cursorhold
  autocmd! CursorHold * silent call CocActionAsync('highlight')
  " Close coc-explorer if it's the last open window
  autocmd! BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
endif
