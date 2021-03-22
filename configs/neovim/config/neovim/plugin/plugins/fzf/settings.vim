if executable("rg")
  let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git/*'"
endif

let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.8}}

" TODO: No preview when window is less than such and such width
let g:fzf_preview_window = ['right:50%','ctrl-/']

