return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [A]dd' })

    vim.keymap.set('n', '<leader>sj', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[S]how Harpoon [J]ump list' })
    vim.keymap.set('n', '<leader>fj', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[F]ind Harpoon [J]ump list' })

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
