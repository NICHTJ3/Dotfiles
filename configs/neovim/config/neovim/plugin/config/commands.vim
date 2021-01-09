"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Neovim Commands                                "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

command! RmTrail %s/\s\+$//e
command! Breakline :g/^/norm gww
command! Dots FZF ~/Dotfiles
command! Notes FZF ~/Documents/Dev/Notes
