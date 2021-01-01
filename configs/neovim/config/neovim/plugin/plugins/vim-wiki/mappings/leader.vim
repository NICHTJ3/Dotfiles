let g:lmap.p.w = {"name":"Vim Wiki..."}
nmap <leader>pwi <Plug>VimwikiIndex
let g:lmap.p.w.i = "Open Index"

nmap <leader>pwI <Plug>VimwikiTabIndex
let g:lmap.p.w["I"] = "Open Index In New Tab"

nmap <leader>pwy <Plug>VimwikiMakeYesterdayDiaryNote
let g:lmap.p.w.y = "Yesterdays Entry"

nmap <leader>pwn <Plug>VimwikiMakeDiaryNote
let g:lmap.p.w.n = "Todays Entry"

nmap <leader>pwN <Plug>VimwikiTabMakeDiaryNote
let g:lmap.p.w["N"] = "Todays Entry In New Tab"

nmap <leader>pwt <Plug>VimwikiMakeTomorrowDiaryNote
let g:lmap.p.w.t = "Tomorrow Entry"

nmap <leader>pwr <Plug>VimwikiDiaryGenerateLinks
let g:lmap.p.w.r = "Refresh Diary"

nmap <leader>pwd <Plug>VimwikiDiaryIndex
let g:lmap.p.w.d = "Open Diary"

nmap <leader>pws <Plug>VimwikiUISelect
let g:lmap.p.w.s = "Select"
