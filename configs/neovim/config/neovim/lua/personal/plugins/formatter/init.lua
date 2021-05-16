local formattable_file_types =
    require('personal.plugins.formatter.utils').formattable_file_types

require("formatter").setup({logging = false, filetype = formattable_file_types})

vim.cmd('nnoremap <leader>d <Cmd>Format<CR>')
