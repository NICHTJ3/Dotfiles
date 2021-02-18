" TODO: Move these into autoload files
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Neovim functions                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                  SearchText                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
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

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                           Markdown toggle checkbox                           "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let s:bullet = '^\s*\%(\d\+\.\|[-+*]\)'
function! CheckboxToggle(...) abort
  let c = a:0 ? a:1 : toupper(escape(nr2char(getchar()), '\.*'))

  if c !~ '\p'
    return
  endif

  call search(s:bullet, 'bcW')

  for i in range(v:count1)
    try
      execute 'keeppatterns s/' . s:bullet . '\s\+\[\zs.\ze\]/\=submatch(0) == c ? " " : c/'
    catch /E486/
      try
        execute 'keeppatterns s/' . s:bullet . '\s\zs/[' . c . '] /'
      catch
      endtry
    endtry

    if i < v:count1 - 1 && !search(s:bullet, 'W')
      break
    endif
  endfor

  if exists('*repeat#set')
    call repeat#set(":\<C-u>call CheckboxToggle('" . c . "')\<CR>")
  endif
endfunction
