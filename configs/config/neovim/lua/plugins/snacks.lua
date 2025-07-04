return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts_extend = {
    'explorer',
  },
  ---@type snacks.Config
  opts = {
    input = { enabled = true },
    quickfile = { enabled = true },
    bigfile = { enabled = true },
    words = { enabled = true },
    scope = { enabled = true },
    indent = { enabled = true },
    scroll = { enabled = true },
    terminal = { enabled = true },
    lazygit = {
      enabled = true,
      theme = {
        [241] = { fg = 'Special' },
        activeBorderColor = { fg = 'MatchParen', bold = true },
        cherryPickedCommitBgColor = { fg = 'Identifier' },
        cherryPickedCommitFgColor = { fg = 'Function' },
        defaultFgColor = { fg = 'Normal' },
        inactiveBorderColor = { fg = 'MatchParen' },
        optionsTextColor = { fg = 'Function' },
        searchingActiveBorderColor = { fg = 'MatchParen', bold = true },
        selectedLineBgColor = { bg = 'Visual' }, -- set to `default` to have no background colour
        unstagedChangesColor = { fg = 'DiagnosticError' },
      },
    },
    gitbrowse = { enabled = true },
    toggle = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
    zen = {
      toggles = {
        dim = false,
        git_signs = false,
        mini_diff_signs = false,
        inlay_hints = false,
      },
    },
  },
  keys = {
    -- Words
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },

    -- Lazygit
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'Lazygit Current File History',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'Lazygit Log (cwd)',
    },
    -- Git and git browse
    -- NOTE: I'm not sure I'll really use these over git signs so maybe remove them
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
    },

    -- Nvim news!! OMG I've wanted this setup for so long and couldn't be bothered
    {
      '<leader>N',
      desc = 'Neovim News',
      function()
        Snacks.win {
          file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = 'yes',
            statuscolumn = ' ',
            conceallevel = 3,
          },
        }
      end,
    },

    -- Notifier
    {
      '<leader>un',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },

    -- Zen mode
    {
      '<leader>z',
      function() end,
      desc = '[Z]en Mode',
    },
    {
      '<leader>zo',
      function()
        Snacks.zen()
      end,
      desc = '[Z]en Mode [O]pen',
    },
    {
      '<leader>zz',
      function()
        Snacks.zen.zoom()
      end,
      desc = '[Z]en Mode [Z]oom',
    },
  },
  init = function() end,
}
