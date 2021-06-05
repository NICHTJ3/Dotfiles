" Open Telescope Files
nnoremap <leader>lf :lua require('telescope.builtin').find_files()<CR>

" Open Telescope buffers
nnoremap <leader>lb :lua require('telescope.builtin').buffers()<CR>

" " Edit vim config
nnoremap <leader>ev :lua require("sv.configs.telescope").EditVimFiles()<CR>

" Open live grep search
nnoremap <leader>/ :lua require('telescope.builtin').live_grep()<CR>

" Search current word
nnoremap <leader>sw :lua require('telescope.builtin').grep_string()<CR>

" Github-coauthors
nnoremap <leader>gca <cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>
