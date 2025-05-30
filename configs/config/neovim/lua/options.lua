-- [[ Setting options ]]
-- See `:help vim.opt`

-- Disable the intro screen on startup see `:help shortmess` for more info
vim.opt.shortmess = 'ltToOCFI'

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'auto'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Open splits to the right or below when using `:vsp` and `:sp`
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Better linewrap
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(' ', 3)

-- Respect modeline comments at the end of files
vim.opt.modeline = true

-- No swapfile or backup. The popup sucks
vim.opt.swapfile = false
vim.opt.backup = false

-- Treat linewrapped lines as multiple lines when scrolling
vim.opt.smoothscroll = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Hide the netrw banner by default
vim.g.netrw_banner = false

vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.foldopen = { 'block', 'insert', 'jump', 'mark', 'percent', 'quickfix', 'search', 'tag', 'undo' }
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldnestmax = 5 -- Only fold up to this many nested levels.
vim.opt.foldminlines = 1 -- Only fold if there are at least this many lines.
vim.opt.fillchars = { fold = '·', foldopen = '', foldclose = '' }

-- vim: ts=2 sts=2 sw=2 et
