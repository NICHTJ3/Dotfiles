"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                neovim mappings                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"
" TODO: Check if the plugins exist before creating mappings for them?

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Edit vimrc                                    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>ev :e $MYVIMRC<CR>
let g:lmap.e.v = "Edit VIMRC"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Window movement                                "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" Add windows
let g:lmap.w.a = {'name':"Add Window..."}
nnoremap <leader>waj :split Below<CR>
let g:lmap.w.a.j = "Add Down"
nnoremap <leader>wal :vsplit Right<CR>
let g:lmap.w.a.l = "Add Right"
nnoremap <leader>wah :aboveleft vsp Left<CR>
let g:lmap.w.a.h = "Add Left"
nnoremap <leader>wak :above split Above<CR>
let g:lmap.w.a.k = "Add Above"

" Close windows
let g:lmap.w.c = {'name':"Close Window..."}
nnoremap <leader>wco :only<CR>
let g:lmap.w.c.o = "Close Others"
nnoremap <leader>wca :qa<CR>
let g:lmap.w.c.a = "Close All"
nnoremap <leader>wcc :q<CR>
let g:lmap.w.c.c = "Close Current"


" Move windows
let g:lmap.w.m = {'name':"Move Window..."}
nnoremap <leader>wmj <c-w>J
let g:lmap.w.m.j = "Move Down"
nnoremap <leader>wml <c-w>L
let g:lmap.w.m.l = "Move Right"
nnoremap <leader>wmh <c-w>H
let g:lmap.w.m.h = "Move Left"
nnoremap <leader>wmk <c-w>K
let g:lmap.w.m.k = "Move Above"

" Navigate windows
let g:lmap.w.n = {'name':"Navigate Window..."}
nnoremap <leader>wnj <c-w>j
let g:lmap.w.n.j = "Navigate Down"
nnoremap <leader>wnl <c-w>l
let g:lmap.w.n.l = "Navigate Right"
nnoremap <leader>wnh <c-w>h
let g:lmap.w.n.h = "Navigate Left"
nnoremap <leader>wnk <c-w>k
let g:lmap.w.n.k = "Navigate Above"


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                        Regenerate ctags with leader ar                       "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <Leader>aR :!ctags --extra=+f -R *<CR><CR>
let g:lmap.a.R = "Regen Ctags"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               markdown preview                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <silent> <leader>ac :<C-u>call CheckboxToggle()<CR>X<CR>
let g:lmap.a.c = 'Toggle Checkbox'

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Toggle spell                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>as :set spell!<CR>
let g:lmap.a.s = "Toggle Spell Check"

" TODO: Move these

" Vim diff
if &diff
  let g:lmap.g.d = {"name":"Diff..."}
  nnoremap <leader>gdh :diffget //2
  let g:lmap.g.d.f = "Take Diff On The Right"
  nnoremap <leader>gdl :diffget //3
  let g:lmap.g.d.f = "Take Diff On The Right"
endif
