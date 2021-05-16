require'lualine'.setup {
    options = {lower = true, theme = 'tokyonight'},
    sections = {lualine_a = {{'mode', lower = false}}, lualine_b = {'branch'}}
}
