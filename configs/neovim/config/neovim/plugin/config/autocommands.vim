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

    " TODO: Find a nicer place for this?
    " Install New Plugins if not installed
    if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | q
    endif

    " Relative linenums only in normal mode
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber

    " TODO: Auto source ftplugin etc
    " Automatically source vimrc
    autocmd BufWritepost *.vim source $MYVIMRC

    " Terminal
    autocmd TermOpen * startinsert " Start terminal in insert mode
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber " Turn off line numbers etc
  augroup END
endfunction

call s:AutoCommands()
