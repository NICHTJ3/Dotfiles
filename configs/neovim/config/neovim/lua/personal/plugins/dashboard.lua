local dashboard = {
    custom_header = {
        '        _    __      ____          ____     ',
        '       | |  / /___ _/ / /_  ____ _/ / /___ _',
        '       | | / / __ `/ / __ \\/ __ `/ / / __ `/',
        '       | |/ / /_/ / / / / / /_/ / / / /_/ / ',
        '       |___/\\__,_/_/_/ /_/\\__,_/_/_/\\__,_/  '
    }
}

vim.g.dashboard_custom_header = dashboard.custom_header

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {
        description = {'  Find File          '},
        command = 'Telescope find_files'
    },
    b = {
        description = {'  Recently Used Files'},
        command = 'Telescope oldfiles'
    },
    d = {
        description = {'  Find Word          '},
        command = 'Telescope live_grep'
    },
    e = {
        description = {'  Settings           '},
        command = ':e ~/.config/nvim/lv-settings.lua'
    }
}
