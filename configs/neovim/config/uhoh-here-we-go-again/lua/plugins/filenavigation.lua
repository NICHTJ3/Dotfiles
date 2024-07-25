return {
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    },
    keys = {
      { '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' } },
      { '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' } },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
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
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
    },
    -- stylua: ignore
    keys = {
      -- local builtin = require rtelescope.builtin'
      { '<leader>sr', function() require('telescope.builtin').resume() end, desc = '[S]earch [R]esume', },
      { '<leader>sk', function() require('telescope.builtin').keymaps() end, desc = '[S]earch [K]eymaps', },
      { '<leader>ss', function() require('telescope.builtin').builtin() end, desc = '[S]earch [S]elect Telescope', },
      { '<leader>sw', function() require('telescope.builtin').grep_string() end, desc = '[S]earch current [W]ord', },
      { '<leader>sg', function() require('telescope.builtin').live_grep() end, desc = '[S]earch by [G]rep', },
      { '<leader>sd', function() require('telescope.builtin').diagnostics() end, desc = '[S]earch [D]iagnostics', },
      { '<leader>sf', function() require('telescope.builtin').find_files() end, desc = '[S]earch [F]iles', },
      { '<leader><space>', function() require('telescope.builtin').find_files() end, desc = 'Search Files', },
      { '<leader>/', function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, }) end, desc = ' Fuzzily search in current buffer', },
      { '<leader>uC', function() require('telescope.builtin').colorscheme { enable_preview = true } end, desc = 'Colorscheme with Preview', },
      -- Shortcut for searching your Neovim configuration files
      { '<leader>sn', function() require('telescope.builtin').find_files { follow = true, cwd = vim.fn.stdpath 'config', file_ignore_patterns = { 'spell', 'undodir', }, } end, desc = '[S]earch [N]eovim files', },
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
          },
          grep_string = {
            additional_args = { '--hidden' },
          },
          live_grep = {
            additional_args = { '--hidden' },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
    end,
  },
}
