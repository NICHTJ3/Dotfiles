-- TODO: Finish and comment this file
-- Movement and nav settings
vim.opt.cursorline = true;
-- Allow visual block mode to select empty collumns
vim.opt.virtualedit = 'block';
vim.opt.tags = './tags;/,tags;/'
vim.opt.sidescroll = 1
-- Enabls mouse interaction
if vim.fn.has('mouse') then vim.opt.mouse = "a" end

-- Theme and appearance
vim.opt.shortmess:append({I = true, c = true})
vim.opt.showcmd = true
vim.opt.list = true
vim.opt.listchars = {
    tab = '>~',
    nbsp = '_',
    trail = '.',
    extends = '>',
    precedes = '<'
}

vim.opt.signcolumn = 'auto'

vim.opt.textwidth = 80

-- Term gui colors
vim.cmd [[
    set t_Co=
    set t_ut=
    set ttyfast
    if has("termguicolors")
      set t_Co=256
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif
]]

-- Sane window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Searching
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
