set background=dark

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer", "coc-explorer","vim-plug","nerdtree" ,"NvimTree"]
let g:tokyonight_hide_inactive_statusline = 1
let g:tokyonight_dark_sidebar = 1
let g:tokyonight_dark_float = 1
let g:tokyonight_italic_comments = 1
let g:tokyonight_transparent = 1

" silent! colorscheme tokyonight
" iterm colors for tokyonight:
" https://github.com/folke/tokyonight.nvim/tree/main/extras

silent! colorscheme kanagawa
" iterm colors for kanagawa:
" https://github.com/rebelot/kanagawa.nvim/blob/master/extras

" Black line numbers and signcolumn
hi LineNr guibg=0
hi GitGutterAdd guibg=0
hi GitGutterChange guibg=0
hi GitGutterDelete guibg=0
hi SignColumn guibg=0

" Make ColorColumn the same color as cursorline
hi! link ColorColumn CursorLine
