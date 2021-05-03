
" Open Telescope Files
nnoremap <leader>lf :lua require('telescope.builtin').find_files()<CR>
let g:lmap.l.f = "List Files"
" " Open FZF buffers
" nnoremap <leader>lb :Buffers<CR>
" let g:lmap.l.b = "List Buffers"
" " Edit vim config
nnoremap <leader>ev :lua require("personal.plugins.telescope").EditVimFiles()<CR>
let g:lmap.e.v = "Edit vim config"
" " Edit dotfiles
" nnoremap <leader>ed :Dots<CR>
" let g:lmap.e.d = "Edit dotfiles"

