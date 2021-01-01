"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                              Neovim AutoCommands                             "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
augroup SourceVimrcOnSave
  autocmd!
  autocmd BufWritepost *.vim source $MYVIMRC
augroup END

augroup Terminal
  autocmd!
  autocmd TermOpen * startinsert
  " Turn off line numbers etc
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber
augroup end

" Color all columns past 81
" TODO: Setup blacklist for which_key
autocmd! Filetype * let &l:colorcolumn='+' . join(range(1, 254), ',+')

" Relative linenums only in normal mode
autocmd! InsertEnter * set norelativenumber
autocmd! InsertLeave * set relativenumber

" Install New Plugins if not installed
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | q
endif

