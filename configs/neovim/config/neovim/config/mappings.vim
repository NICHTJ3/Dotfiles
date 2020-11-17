"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                neovim mappings                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"
" TODO: Check if the plugins exist before creating mappings for them?
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                 Last file                                    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader><leader>l <C-^>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Edit vimrc                                    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>ev :e $MYVIMRC<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                     Change instances of word undercursor                     "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap c* *Ncgn

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Window movement                                "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>w <C-w>
" Create or move to split with `<C-<h,j,k,l>>`
nnoremap <C-h> :call WinMove('h')<CR>
nnoremap <C-j> :call WinMove('j')<CR>
nnoremap <C-k> :call WinMove('k')<CR>
nnoremap <C-l> :call WinMove('l')<CR>

" Create splits with `<leader> a <h,j,k,l>`
nnoremap <leader>aj :split Below<CR>
nnoremap <leader>al :vsplit Right<CR>
nnoremap <leader>ah :aboveleft vsp Left<CR>
nnoremap <leader>ak :above split Above<CR>


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    Open FZF                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" Open FZF git files
nnoremap <expr> <C-f> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
nnoremap <expr> <leader>f (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
" Open FZF files
nnoremap <C-p> :Files<CR>
nnoremap <leader>p :Files<CR>
" Open FZF buffers
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>b :Buffers<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                     Y yanks to end of line like it should                    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap Y y$

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                     pasting over text works like you would expect            "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
xnoremap p pgvy

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Maximise splits                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap \| <C-w>\|
nnoremap _ <C-w>_

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Only buffer                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>ob :only<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                 Nav quickfix                                 "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader><up> :cprev<cr>
nnoremap <leader><down> :cnext<cr>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                   Better visual block indentation changing                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
vnoremap < <gv
vnoremap > >gv

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                        Regenerate ctags with leader rt                       "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <Leader>rt :!ctags --extra=+f -R *<CR><CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                        Resize with arrow keys and ctrl                       "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Down> :resize -5<CR>
nnoremap <C-Up>   :resize +5<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                        Search duck duck go with gs                           "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nmap <silent> gs :set opfunc=DuckIt<CR>g@
vmap <silent> gs :<C-u>call DuckIt(visualmode(), 1)<Cr>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               markdown preview                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" TODO: Check if we are in a md file
nnoremap <leader>cc :<C-u>call CheckboxToggle()<CR>X

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Toggle spell                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>z :set spell!<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Git fugitive                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>glo :Glog<CR>
nnoremap <leader>gb :GBranches<CR>

" Below are used in vim diff
if &diff
    nnoremap <leader>gh :diffget //2
    nnoremap <leader>gl :diffget //3
endif

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


