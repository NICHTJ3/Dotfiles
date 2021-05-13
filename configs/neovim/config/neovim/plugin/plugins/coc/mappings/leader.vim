" TODO: Seporate these
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Coc mappings                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

" Needed for coc bindings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Tab and shift tab to nav
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

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
      \ <SID>check_back_space() ? "\<TAB>" :
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
nmap <silent> <leader>aa :<C-u>CocAction<CR>
let g:lmap.a.a = "Coc Action Menu"

"Coc rename symbol
nmap <leader>ar <Plug>(coc-rename)
let g:lmap.a.r = "Rename Current Word"

"Coc extras
" Leader go to mappings
let g:lmap.a.g = {"name":"Go To..."}
nmap <silent> <leader>agd <Plug>(coc-definition)
let g:lmap.a.g.d = "Go To Definition"
nmap <silent> <leader>agt <Plug>(coc-type-definition)
let g:lmap.a.g.t = "Go To Type Definition"
nmap <silent> <leader>agi <Plug>(coc-implementation)
let g:lmap.a.g.i = "Go To Implementation"
nmap <silent> <leader>agr <Plug>(coc-references)
let g:lmap.a.g.r = "Go To References"

" Non-Leader go to mappings
nmap <silent> gd <Plug>(coc-definition)

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
nnoremap <leader>sl :CocSearch <c-r>/<CR>
let g:lmap.s.l = "CocSearch For Last Search"

" CocSearch for current word
nnoremap <leader>sw :CocSearch <c-r><c-w><CR>
let g:lmap.s.w = "CocSearch For Current Word"

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
