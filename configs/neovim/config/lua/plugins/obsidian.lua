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
    { '<leader>os', '<cmd>ObsidianSearch<CR>', desc = '[S]earch' },
    { '<leader>ot', '<cmd>ObsidianToday<CR>', desc = '[T]oday' },
    { '<leader>oT', '<cmd>ObsidianTomorrow<CR>', desc = '[T]omorrow' },
    { '<leader>oy', '<cmd>ObsidianYesterday<CR>', desc = '[Y]esterday' },
    { '<leader>oj', '<cmd>ObsidianDailies<CR>', desc = '[J]ournal' },
    { '<leader>od', '<cmd>ObsidianDailies<CR>', desc = '[D]iary' },
    { '<leader>oh', '<cmd>ObsidianTags<CR>', desc = '[H]ashtags/Tags' },
  },
  ft = 'markdown',
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
