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
let lmap = get(g:, 'lmap', {}) " Declare a dictionary to be used by which-key later on
let lmap['_'] = { 'name': 'which_key_ignore' } " Ignore +prefix mappings
" Mapping Catagories {{{
let lmap.g = {"name":"Git..."}
let lmap.s = {"name":"Search..."}
let lmap.a = {"name":"Actions..."}
let lmap.o = {"name":"Organize..."}
let lmap.l = {"name":"List..."}
let lmap.e = {"name":"Edit Files..."}
let lmap.p = {"name":"Plugins..."}
let lmap.w = {"name":"Window..."}
" }}}
