return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  cmds = {
    'ObsidianToday',
    'ObsidianTomorrow',
    'ObsidianYesterday',
    'ObsidianSearch',
    'ObsidianDailies',
  },
  keys = {
    { '<leader>o', desc = '[O]bsidian' },
    { '<leader>os', '<cmd>ObsidianSearch<CR>', desc = '[O]bsidian [S]earch' },
    { '<leader>ot', '<cmd>ObsidianToday<CR>', desc = '[O]bsidian [T]oday' },
    { '<leader>oT', '<cmd>ObsidianTomorrow<CR>', desc = '[O]bsidian [T]omorrow' },
    { '<leader>oy', '<cmd>ObsidianYesterday<CR>', desc = '[O]bsidian [Y]esterday' },
    { '<leader>oj', '<cmd>ObsidianDailies<CR>', desc = '[O]bsidian [J]ournal' },
    { '<leader>od', '<cmd>ObsidianDailies<CR>', desc = '[O]bsidian [D]iary' },
    { '<leader>oh', '<cmd>ObsidianTags<CR>', desc = '[O]bsidian [H]ashtags/Tags' },
  },
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Set the conceallevel for markdown files',
      pattern = 'markdown',
      group = vim.api.nvim_create_augroup('obsidian', { clear = true }),
      callback = function()
        vim.cmd 'setlocal conceallevel=2'
      end,
    })

    require('obsidian').setup {
      workspaces = {
        {
          name = 'work',
          path = '~/vaults/Work',
        },
      },
      daily_notes = {
        folder = 'journal',
        template = nil,
      },
      ui = {
        enable = true, -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        max_file_length = 5000, -- disable UI features for files with more than this many lines
        -- Define how various check-boxes are displayed
        checkboxes = {
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
        },
      },
    }
  end,
}
