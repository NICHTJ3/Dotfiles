-- pasting over text works like you would expect
vim.keymap.set('x', 'p', 'pgvy', {noremap = true})

-- Better visual block indentation changing
vim.keymap.set('v', '<', '<gv', {noremap = true})
vim.keymap.set('v', '>', '>gv', {noremap = true})

-- Search duck duck go with gs
vim.keymap.set('v', 'gs', '<cmd><C-u>call DuckIt(visualmode(), 1)<Cr>',
               {silent = true})
