function! DuckIt(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use '< and '> marks.
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
  endif

  let search = substitute(trim(@@), ' \+', '+', 'g')

  let uname = substitute(system('uname'),'\n','','')
  if uname == 'Linux'
    if system('$PATH') =~ '/mnt/c/Windows'
      " Windows Subsystem
      silent exe "!cmd.exe /c start 'https://duckduckgo.com/?q=" . search . "'"
    else
      " Linux
      silent exe "!open 'https://duckduckgo.com/?q=" . search . "'"
    endif
  else
    " TODO: Fix this for native windows cli and mac
    silent exe "!open 'https://duckduckgo.com/?q=" . search . "'"
  endif

  let &selection = sel_save
  let @@ = reg_save
endfunction


noremap gs :silent! set opfunc=DuckIt<CR>g@
