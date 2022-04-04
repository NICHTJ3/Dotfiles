-- TODO: Finish and comment this file
-- My settings
vim.opt.hidden = true
vim.opt.belloff = 'all'
vim.opt.confirm = true
vim.opt.wrap = false -- Disable line wrap
vim.opt.autoread = true -- Automaticaly read file changes
vim.opt.spellfile = vim.fn.expand('~') .. '/.config/nvim/spell/en.utf-8.add'
vim.opt.undofile = true -- Save undos after file closes
vim.opt.undodir = vim.fn.expand('~') .. '/.config/nvim/undodir' -- Keep undo history in this place
vim.opt.history = 1000
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.lazyredraw = true -- Redraws screen only after user input only
vim.opt.updatetime = 100

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

-- Autocomplete options
-- set wildoptions=pum " this is disabled because of cmp
vim.opt.pumheight = 15
vim.opt.pumblend = 0 -- Completion transparency

-- Line numbers
vim.opt.number = true -- Relative and normal line numbering
vim.opt.relativenumber = true -- Relative and normal line numbering

-- Fold settings
vim.opt.foldnestmax = 10
vim.opt.foldcolumn = '0'
