return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    '<leader>aj',
    '<leader>sj',
    '˙', -- <Meta> + H
    '∆', -- <Meta> + J
    '˚', -- <Meta> + K
    '¬', -- <Meta> + L
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>aj', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [A]dd to [J]ump' })

    vim.keymap.set('n', '<leader>sj', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[S]how Harpoon [J]ump list' })

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
