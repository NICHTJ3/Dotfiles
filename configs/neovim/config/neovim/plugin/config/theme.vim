set background=dark

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer", "coc-explorer","vim-plug","nerdtree" ,"NvimTree"]
let g:tokyonight_hide_inactive_statusline = 1
let g:tokyonight_dark_sidebar = 0
let g:tokyonight_dark_float = 1
let g:tokyonight_italic_comments = 1

let g:tokyodark_transparent_background = 0
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 1
let g:tokyodark_color_gamma = "1.0"

silent! colorscheme tokyodark

" Black line numbers and signcolumn
hi LineNr guibg=0
hi GitGutterAdd guibg=0
hi GitGutterChange guibg=0
hi GitGutterDelete guibg=0
hi SignColumn guibg=0

" Make ColorColumn the same color as cursorline
hi! link ColorColumn CursorLine
