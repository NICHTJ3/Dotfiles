local utils = require('sv.configs.formatter.utils').formattable_file_types

require("formatter").setup({
    logging = false,
    filetype = utils.formattable_file_types
})

vim.cmd('nnoremap <leader>d <Cmd>Format<CR>')

local M = {}

M.formattable_file_types = utils.formattable_file_types

return M
