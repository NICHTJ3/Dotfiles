"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Coc mappings                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

" Needed for coc bindings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Tab and shift tab to nav
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

" Coc format
nnoremap <silent> <Leader>d :call CocAction('format')<CR>
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
nnoremap <silent> <leader>cl :<C-u>CocList diagnostics<CR>

" Ctrl space like vscode
inoremap <silent><expr> <c-space> coc#refresh()

" Orginize imports
nnoremap <silent> <leader>or :call     CocAction('runCommand', 'editor.action.organizeImport')<CR>
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" CocCommands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>

" Code action leader a
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>aa :<C-u>CocCommand actions.open<CR>

"Coc rename symbol
nmap <leader>rn <Plug>(coc-rename)

"Coc extras
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Meta o swap header source
nnoremap <m-o> :CocCommand clangd.switchSourceHeader<CR>

" Open coc-explorer mappings
nnoremap <C-n> :CocCommand explorer --preset simplify<CR>
nnoremap <leader>n :CocCommand explorer --preset simplify<CR>

" Coc yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" CocSearch for last search
nnoremap <leader>ls :CocSearch <c-r>/<CR>
