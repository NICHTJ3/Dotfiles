return {
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
}
