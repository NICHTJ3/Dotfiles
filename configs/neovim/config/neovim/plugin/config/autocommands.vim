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

      "  autocmd VimEnter * lua require'sv.autocommands'.vim_enter()
      "  autocmd WinEnter * lua require'sv.autocommands'.win_enter()
    endif

    " Relative linenums only in normal mode
    " TODO: Move these to lua and check that we're not on dashboard
    " autocmd InsertEnter * set norelativenumber
    " autocmd InsertLeave * set relativenumber

    " Terminal
    autocmd TermOpen * startinsert " Start terminal in insert mode
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber " Turn off line numbers etc
  augroup END
endfunction

call s:AutoCommands()
