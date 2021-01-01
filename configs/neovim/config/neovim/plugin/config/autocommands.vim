"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                              Neovim AutoCommands                             "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


function! s:AutoCommands()
  augroup AutoCommands
     autocmd!
     if exists('+colorcolumn') &&
           \ exists('+winhighlight') &&
           \ has('conceal') &&
           \ has('folding') &&
           \ has('mksession') &&
           \ has('statusline') &&
           \ has('nvim')

       autocmd VimEnter * lua require'personal.autocommands'.vim_enter()
       autocmd WinEnter * lua require'personal.autocommands'.win_enter()
    endif

    " Install New Plugins if not installed
    if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | q
    endif

    " Relative linenums only in normal mode
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber
  augroup END

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
endfunction

call s:AutoCommands()




