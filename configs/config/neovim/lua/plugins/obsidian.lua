return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  cmd = {
    'Obsidian',
  },
  keys = {
    { '<leader>o', desc = '[O]bsidian' },
    { '<leader>os', '<cmd>Obsidian search<CR>', desc = '[S]earch' },
    { '<leader>ot', '<cmd>Obsidian today<CR>', desc = '[T]oday' },
    { '<leader>oT', '<cmd>Obsidian tomorrow<CR>', desc = '[T]omorrow' },
    { '<leader>oy', '<cmd>Obsidian yesterday<CR>', desc = '[Y]esterday' },
    { '<leader>oj', '<cmd>Obsidian dailies<CR>', desc = '[J]ournal' },
    { '<leader>od', '<cmd>Obsidian dailies<CR>', desc = '[D]iary' },
    { '<leader>oh', '<cmd>Obsidian tags<CR>', desc = '[H]ashtags/Tags' },
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
          path = '~/.obsidian/Work',
        },
      },
      daily_notes = {
        folder = 'journal',
        template = nil,
      },
      completion = {
        blink = true,
      },
      ui = {
        enable = false, -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        max_file_length = 5000, -- disable UI features for files with more than this many lines
      },
      legacy_commands = false,
    }
  end,
}
