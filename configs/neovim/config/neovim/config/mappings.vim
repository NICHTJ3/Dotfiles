"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                neovim mappings                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"
" TODO: Check if the plugins exist before creating mappings for them?

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                            Mapping Catagories                                "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let g:lmap.g = {"name":"Git..."}
let g:lmap.s = {"name":"Search..."}
let g:lmap.a = {"name":"Actions..."}
let g:lmap.o = {"name":"Organize..."}
let g:lmap.l = {"name":"List..."}
let g:lmap.e = {"name":"Edit Files..."}
let g:lmap.p = {"name":"Plugins..."}
let g:lmap.w = {"name":"Window..."}

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Edit vimrc                                    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>ev :e $MYVIMRC<CR>
let g:lmap.e.v = "Edit VIMRC"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                     Change instances of word undercursor                     "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap c* *Ncgn

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


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    Open FZF                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" Open FZF files
nnoremap <leader>lf :Files<CR>
let g:lmap.l.f = "List Files"
" Open FZF buffers
nnoremap <leader>lb :Buffers<CR>
let g:lmap.l.b = "List Buffers"

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
"                                 Nav quickfix                                 "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <up> :cprev<cr>
nnoremap <down> :cnext<cr>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                   Better visual block indentation changing                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
vnoremap < <gv
vnoremap > >gv

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                        Regenerate ctags with leader ar                       "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <Leader>aR :!ctags --extra=+f -R *<CR><CR>
let g:lmap.a.R = "Regen Ctags"

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
nnoremap <silent> <leader>ac :<C-u>call CheckboxToggle()<CR>X<CR>
let g:lmap.a.c = 'Toggle Checkbox'

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Toggle spell                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>z :set spell!<CR>
let g:lmap.z = "Toggle Spell Check"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Git fugitive                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>gs :G<CR>
let g:lmap.g.s = "Git Status"
nnoremap <leader>gc :Gcommit<CR>
let g:lmap.g.c = "Git Commit"
nnoremap <leader>gp :Gpush<CR>
let g:lmap.g.p = "Git Push"
nnoremap <leader>gl :Glog<CR>
let g:lmap.g.l = "Git Log"
nnoremap <leader>gb :GBranches<CR>
let g:lmap.g.b = "FZF Git Branches"
nnoremap <leader>gf :GitFiles<CR>
let g:lmap.g.f = "FZF Git Files"

let g:lmap.g.h = {"name":"Git Hunks..."}

nmap <leader>ghs <Plug>(GitGutterStageHunk)
let g:lmap.g.h.s = "Stage"
nmap <leader>ghu <Plug>(GitGutterUndoHunk)
let g:lmap.g.h.u = "Undo"
nmap <leader>ghp <Plug>(GitGutterPreviewHunk)
let g:lmap.g.h.p = "Preview"

" Below are used in vim diff
if &diff
    let g:lmap.g.d = {"name":"Diff..."}
    nnoremap <leader>gdh :diffget //2
    let g:lmap.g.d.f = "Take Diff On The Right"
    nnoremap <leader>gdl :diffget //3
    let g:lmap.g.d.f = "Take Diff On The Right"
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


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Coc mappings                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

" Tab and shift tab to nav
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>Check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Show documentation
nnoremap <silent> K :call <SID>Show_documentation()<CR>
nnoremap <silent> gh :call <SID>Show_documentation()<CR>

" Coc format
nnoremap <silent> <Leader>d :call CocAction('format')<CR>
let g:lmap.d = "Format Document"
"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Expand snip with tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>Check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" Ctrl j and k next and previous stop
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" Coc list errors
nnoremap <silent> <leader>le :<C-u>CocFzfList diagnostics<CR>
let g:lmap.l.e = "List Coc Errors"

" Ctrl space like vscode
inoremap <silent><expr> <c-space> coc#refresh()

" Orginize imports
nnoremap <silent> <leader>or :call     CocAction('runCommand', 'editor.action.organizeImport')<CR>
let g:lmap.o.r = "Organize Imports"
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" CocCommands
nnoremap <silent> <leader>lc  :<C-u>CocFzfList commands<cr>
let g:lmap.l.c = "List Coc Commands"

" Code action leader a
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>aa :<C-u>CocCommand actions.open<CR>
let g:lmap.a.a = "Coc Action Menu"

"Coc rename symbol
nmap <leader>ar <Plug>(coc-rename)
let g:lmap.a.r = "Rename Current Word"

"Coc extras
let g:lmap.a.g = {"name":"Go To..."}
nmap <silent> <leader>agd <Plug>(coc-definition)
let g:lmap.a.g.d = "Go To Definition"
nmap <silent> <leader>agt <Plug>(coc-type-definition)
let g:lmap.a.g.t = "Go To Type Definition"
nmap <silent> <leader>agi <Plug>(coc-implementation)
let g:lmap.a.g.i = "Go To Implementation"
nmap <silent> <leader>agr <Plug>(coc-references)
let g:lmap.a.g.r = "Go To References"

" Meta o swap header source
nnoremap <m-o> :CocCommand clangd.switchSourceHeader<CR>

" Open coc-explorer mappings
nnoremap <C-n> :CocCommand explorer --preset simplify<CR>
nnoremap <leader>n :CocCommand explorer --preset simplify<CR>
let g:lmap.n = "File Explorer"

" Coc yank
nnoremap <silent> <leader>ly  :<C-u>CocFzfList yank<cr>
let g:lmap.l.y = "List Yanked Text"

" CocSearch for last search
nnoremap <leader>sw :CocSearch <c-r>/<CR>
let g:lmap.s.w = "Search For Current Word"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                 Plugin Mappings                              "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                   VimWIKI                                    "
let g:lmap.p.w = {"name":"Vim Wiki..."}
nmap <leader>pwi <Plug>VimwikiIndex
let g:lmap.p.w.i = "Open Index"

nmap <leader>pwI <Plug>VimwikiTabIndex
let g:lmap.p.w["I"] = "Open Index In New Tab"

nmap <leader>pwy <Plug>VimwikiMakeYesterdayDiaryNote
let g:lmap.p.w.y = "Yesterdays Entry"

nmap <leader>pwn <Plug>VimwikiMakeDiaryNote
let g:lmap.p.w.n = "Todays Entry"

nmap <leader>pwN <Plug>VimwikiTabMakeDiaryNote
let g:lmap.p.w["N"] = "Todays Entry In New Tab"

nmap <leader>pwt <Plug>VimwikiMakeTomorrowDiaryNote
let g:lmap.p.w.t = "Tomorrow Entry"

nmap <leader>pwr <Plug>VimwikiDiaryGenerateLinks
let g:lmap.p.w.r = "Refresh Diary"

nmap <leader>pwd <Plug>VimwikiDiaryIndex
let g:lmap.p.w.d = "Open Diary"

nmap <leader>pws <Plug>VimwikiUISelect
let g:lmap.p.w.s = "Select"
