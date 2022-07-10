local formattable_file_types = require('sv.configs.formatter.utils').formattable_file_types

require("formatter").setup({ logging = false, filetype = formattable_file_types })

vim.keymap.set('n', '<leader>d', '<Cmd>Format<CR>')
