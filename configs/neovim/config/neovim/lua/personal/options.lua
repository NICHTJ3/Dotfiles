-- TODO: Finish and comment this file
-- Movement and nav settings
vim.opt.cursorline = 1;
-- Allow visual block mode to select empty collumns
vim.opt.virtualedit = 'block';
vim.opt.tags = './tags;/,tags;/'
vim.opt.sidescroll = true
-- Enabls mouse interaction
if vim.fn.has('mouse') then vim.opt.mouse = "a" end

-- Theme and appearance
vim.opt.shortmess:appended({I = true, c = true})
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

