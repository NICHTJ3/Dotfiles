" Sources vim config files from ~/.config/nvim/
runtime! config/pluggins.vim
" Check if coc is installed before configuring coc
if exists(':CocConfig')
  runtime! config/coc-pluggins.vim
  runtime! config/coc-mappings.vim
  runtime! config/coc-autocommands.vim
endif
runtime! config/settings.vim
runtime! config/pluggin-settings.vim
runtime! config/functions.vim
runtime! config/commands.vim
runtime! config/aliases.vim
runtime! config/mappings.vim
runtime! config/autocommands.vim
