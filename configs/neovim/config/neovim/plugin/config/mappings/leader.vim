"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                neovim mappings                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"
" TODO: Check if the plugins exist before creating mappings for them?

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Window movement                                "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" Add windows
nnoremap <leader>waj :split Below<CR>
nnoremap <leader>wal :vsplit Right<CR>
nnoremap <leader>wah :aboveleft vsp Left<CR>
nnoremap <leader>wak :above split Above<CR>

" Close windows
nnoremap <leader>wco :only<CR>
nnoremap <leader>wca :qa<CR>
nnoremap <leader>wcc :q<CR>


" Move windows
nnoremap <leader>wmj <c-w>J
nnoremap <leader>wml <c-w>L
nnoremap <leader>wmh <c-w>H
nnoremap <leader>wmk <c-w>K

" Navigate windows
nnoremap <leader>wnj <c-w>j
nnoremap <leader>wnl <c-w>l
nnoremap <leader>wnh <c-w>h
nnoremap <leader>wnk <c-w>k


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                        Regenerate ctags with leader ar                       "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <Leader>aR :!ctags --extra=+f -R *<CR><CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               markdown preview                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <silent> <leader>ac :<C-u>call CheckboxToggle()<CR>X<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Toggle spell                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>as :set spell!<CR>

" TODO: Move these

" Vim diff
if &diff
  nnoremap <leader>gdh :diffget //2
  nnoremap <leader>gdl :diffget //3
endif
