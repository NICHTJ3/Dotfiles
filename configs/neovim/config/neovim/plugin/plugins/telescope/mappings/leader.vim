" Open Telescope Files
nnoremap <leader>lf :lua require('telescope.builtin').find_files()<CR>
" " Open FZF buffers
" nnoremap <leader>lb :Buffers<CR>
" " Edit vim config
nnoremap <leader>ev :lua require("sv.configs.telescope").EditVimFiles()<CR>
" " Edit dotfiles
" nnoremap <leader>ed :Dots<CR>

