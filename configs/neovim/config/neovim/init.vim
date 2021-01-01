"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Neovim config                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"

"                               Settings to apply first                        "
" Map leader to space
let mapleader="\<Space>"
let maplocalleader="\<Space>"

"                               Neovim plugins                                 "
" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

" COC Autocomplete and Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy finder etc
Plug 'antoinemadec/coc-fzf'
Plug 'stsewd/fzf-checkout.vim'
Plug 'junegunn/fzf', { 'dir': '~/.local/bin/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-startify'

" Snippets and Syntax
Plug 'honza/vim-snippets' " Generic snippets
let g:polyglot_disabled = ['coffee-script']
Plug 'sheerun/vim-polyglot' " Generic syntax
Plug 'jackguo380/vim-lsp-cxx-highlight',{'for':['cpp','ccls','clangd']} " With coc-clangd to provide highlighting
Plug 'IrenejMarc/vim-mint' " Mint-lang
"NOTE: The above wont be needed when my pr is merged into polygot

" Git
Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim' " Better commits
Plug 'airblade/vim-gitgutter'

" Fixes
Plug 'bfrg/vim-qf' " Fixes issues with built in quick fix menu
Plug 'tpope/vim-repeat' " Repeat with . sequences that use pluggins
Plug 'zoubin/vim-gotofile' " Better go to file
Plug 'pgdouyon/vim-evanesco' " Clears search highlighting on move

" Must have plugins
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-surround' " Change/Add surrounding character
Plug 'tomtom/tcomment_vim' " Toggle comments
Plug 'mbbill/undotree'
Plug 'tpope/vim-sleuth'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Declare a dictionary to be used by which-key later on {{{
let g:lmap={}
" Ignore +prefix mappings
let g:lmap['_'] = { 'name': 'which_key_ignore' }
" Mapping Catagories
let g:lmap.g = {"name":"Git..."}
let g:lmap.s = {"name":"Search..."}
let g:lmap.a = {"name":"Actions..."}
let g:lmap.o = {"name":"Organize..."}
let g:lmap.l = {"name":"List..."}
let g:lmap.e = {"name":"Edit Files..."}
let g:lmap.p = {"name":"Plugins..."}
let g:lmap.w = {"name":"Window..."}

" }}}
Plug 'roxma/vim-paste-easy' " Automatically set paste when pasting
Plug 'wincent/pinnacle' " Manipulate highlight groups in lua


if system('$PATH') !~ '/mnt/c/Windows'
  " NOTE: This won't be installed if you're on wsl. If you want to use this
  " install it on the native windows neovim build
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

" TMUX
Plug 'christoomey/vim-tmux-navigator' " Unifies tmux and vim navigation
Plug 'roxma/vim-tmux-clipboard' " Unifies vim panes in tmux sessions clipboards
Plug 'tmux-plugins/vim-tmux-focus-events' " Required for vim-tmux-clipboard

" Note taking
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'iamcco/markdown-preview.nvim',{'do':'cd app & npm install'} " Markdown

" UI
Plug 'vim-airline/vim-airline' " Better status
Plug 'chriskempson/base16-vim' " Colorschemes
Plug 'vim-airline/vim-airline-themes' " Airline Colorschemes

call plug#end()
