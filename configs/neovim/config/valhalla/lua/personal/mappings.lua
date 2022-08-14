-------------------
-- Normal mode ----
-------------------

-- Change instances of word undercursor
vim.keymap.set("n", "c*", "*Ncgn", { noremap = true })

-- Y yanks to end of line like it should
vim.keymap.set("n", "Y", "y$", { noremap = true })

-- Maximise splits
vim.keymap.set("n", "|", "<C-w>|", { noremap = true })
vim.keymap.set("n", "_", "<C-w>_", { noremap = true })

-- Resize with arrow keys and ctrl
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<CR>", { noremap = true })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<CR>", { noremap = true })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -5<CR>", { noremap = true })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +5<CR>", { noremap = true })

-- Toggle Last buffer with <backspace>
vim.keymap.set("n", "<backspace>", "<c-^>", { noremap = true })

--------------------------------------------------------------------------------
--                              Window movement
-------------------------------------------------------------------------------
-- Add windows
vim.keymap.set("n", "<leader>waj", ":split Below<CR>")
vim.keymap.set("n", "<leader>wal", ":vsplit Right<CR>")
vim.keymap.set("n", "<leader>wah", ":aboveleft vsp Left<CR>")
vim.keymap.set("n", "<leader>wak", ":above split Above<CR>")

-- Close windows
vim.keymap.set("n", "<leader>wco", ":only<CR>") -- Window close others
vim.keymap.set("n", "<leader>ob", ":only<CR>") -- Only buffer?
vim.keymap.set("n", "<leader>wca", ":qa<CR>") -- Window close all
vim.keymap.set("n", "<leader>wqa", ":qa<CR>") -- Window quit all
vim.keymap.set("n", "<leader>wcc", ":q<CR>") -- Window close current

-- Move windows -- Window move <direction>
vim.keymap.set("n", "<leader>wmj", "<c-w>J")
vim.keymap.set("n", "<leader>wml", "<c-w>L")
vim.keymap.set("n", "<leader>wmh", "<c-w>H")
vim.keymap.set("n", "<leader>wmk", "<c-w>K")

-- NOTE: Other mappings are created with christoomey/vim-tmux-navigator <c-h|j|k|l>
-- Navigate windows -- Window navigate <direction>
vim.keymap.set("n", "<leader>wnj", "<c-w>j")
vim.keymap.set("n", "<leader>wnl", "<c-w>l")
vim.keymap.set("n", "<leader>wnh", "<c-w>h")
vim.keymap.set("n", "<leader>wnk", "<c-w>k")

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                               Toggle spell                                  "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
vim.keymap.set("n", "<leader>ts", ":set spell!<CR>")

-- pasting over text works like you would expect
vim.keymap.set("x", "p", "pgvy", { noremap = true })

-- Better visual block indentation changing
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
--                                 Git                                          "
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
-- Git rebase file mappings
if vim.fn.expand "%:t" == "git-rebase-todo" then
    vim.keymap.set("n", "p", "0ciwpick<ESC>0", { noremap = true })
    vim.keymap.set("n", "r", "0ciwreword<ESC>0", { noremap = true })
    vim.keymap.set("n", "e", "0ciwedit<ESC>0", { noremap = true })
    vim.keymap.set("n", "s", "0ciwsquash<ESC>0", { noremap = true })
    vim.keymap.set("n", "f", "0ciwfixup<ESC>0", { noremap = true })
    vim.keymap.set("n", "x", "0ciwexec<ESC>0", { noremap = true })
    vim.keymap.set("n", "d", "0ciwdrop<ESC>0", { noremap = true })
end

-- Open git status
vim.keymap.set("n", "<leader>ags", "<cmd>G<CR>", { silent = true, noremap = true })
