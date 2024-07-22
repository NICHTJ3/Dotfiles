return {
  'b0o/incline.nvim',
  keys = {
    { '<leader>ui', '<Cmd>lua require"incline".toggle()<Cr>', desc = '[U]I Toggle [I]ncline' },
  },
  config = function()
    local helpers = require 'incline.helpers'
    local devicons = require 'nvim-web-devicons'
    require('incline').setup {
      debounce_threshold = {
        falling = 75,
        rising = 75,
      },
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        -- if filename then return
        if filename == '[No Name]' then
          return nil
        end

        return {
          ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
          ' ',
          { filename, gui = modified and 'bold,italic' or 'bold' },
          ' ',
        }
      end,
    }
  end,
}
