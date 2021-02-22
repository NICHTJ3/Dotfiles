let g:seiya_auto_enable=1

" Doesn't work by default in neovim with true-color terminal the below fixes
" this
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
