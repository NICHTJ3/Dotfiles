"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Neovim config                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"

"                               Settings to apply first                        "
" Map leader to space
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" Source all our pluggins
runtime pluggins.vim

lua require("personal")

" WhichKey
let g:lmap={} " Declare a dictionary to be used by which-key later on
let g:lmap['_'] = { 'name': 'which_key_ignore' } " Ignore +prefix mappings
" Mapping Catagories {{{
let g:lmap.g = {"name":"Git..."}
let g:lmap.s = {"name":"Search..."}
let g:lmap.a = {"name":"Actions..."}
let g:lmap.o = {"name":"Organize..."}
let g:lmap.l = {"name":"List..."}
let g:lmap.e = {"name":"Edit Files..."}
let g:lmap.p = {"name":"Plugins..."}
let g:lmap.w = {"name":"Window..."}
" }}}
