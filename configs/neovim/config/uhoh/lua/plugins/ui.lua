return {
  {
    event = 'VeryLazy',
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      -- set an empty statusline till lualine loads to prevent pop in and page shift
      vim.o.statusline = ' '
    end,
    opts = function(_, opts)
      vim.o.laststatus = 3
      opts.globalstatus = true
      return opts
    end,
  },
  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>b', '', desc = '[B]uffer' },
      { '<leader>bd', '<Cmd>bd<CR>', desc = '[B]uffer [D]elete' },
      { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = '[B]uffer [O]nly' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete [B]uffers to the [R]ight' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete [B]uffers to the [L]eft' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    },
    opts = {
      options = {
      -- stylua: ignore
      diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        mode = 'tabs',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
    end,
  },

  -- icons
  {
    'echasnovski/mini.icons',
    lazy = true,
    opts = {
      file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      },
      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
      },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  -- ui components
  { 'MunifTanjim/nui.nvim', lazy = true },
}
