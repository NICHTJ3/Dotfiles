"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                       Toggle Last buffer with <backspace>                    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <backspace> <c-^>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                         Bufferline.nvim navigation                           "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <Left> :BufferLineCyclePrev<CR>
nnoremap <Right> :BufferLineCycleNext<CR>


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                 Git                                          "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

" Git rebase file mappings
if expand('%:t') == "git-rebase-todo"
  nnoremap p 0ciwpick<ESC>0
  nnoremap r 0ciwreword<ESC>0
  nnoremap e 0ciwedit<ESC>0
  nnoremap s 0ciwsquash<ESC>0
  nnoremap f 0ciwfixup<ESC>0
  nnoremap x 0ciwexec<ESC>0
  nnoremap d 0ciwdrop<ESC>0
endif
