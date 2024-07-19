return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>j', '', desc = 'Harpoon [J]umplist' },
    { '<leader>ja', desc = 'Harpoon [J]umplist [A]dd' },
    { '<leader>js', desc = 'Harpoon [J]ump list [S]how' },
    '˙', -- <Meta> + H
    '∆', -- <Meta> + J
    '˚', -- <Meta> + K
    '¬', -- <Meta> + L
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>ja', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [J]umplist [A]dd' })

    vim.keymap.set('n', '<leader>js', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon [J]ump list [S]how' })

    -- Meta + HJKL to navigate between Harpoon list
    vim.keymap.set('n', '˙', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '∆', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '˚', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '¬', function()
      harpoon:list():select(4)
    end)
  end,
}
