" Open Telescope Files
nnoremap <leader>lf :lua require('sv.configs.telescope').ListFiles()<CR>

" Open Telescope buffers
nnoremap <leader>lb :lua require('telescope.builtin').buffers()<CR>

" Edit nvim config
nnoremap <leader>ev :lua require("sv.configs.telescope").ListNeovim()<CR>

" Open live grep search
nnoremap <leader>/ :lua require('telescope.builtin').live_grep()<CR>

" Search current word
nnoremap <leader>sw :lua require('telescope.builtin').grep_string()<CR>

" Github-coauthors
nnoremap <leader>lca <cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>

" Projects
nnoremap <leader>lp :lua require'sv.configs.telescope'.ListProjects()<CR>
