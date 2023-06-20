vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "core"

-- -- TODO: This should be better
-- function MyFoldText()
--     local line = vim.fn.getline(vim.v.foldstart)
--     return " ⚡ " .. line
-- end
--
-- vim.wo.foldtext = "v:lua.MyFoldText()"
