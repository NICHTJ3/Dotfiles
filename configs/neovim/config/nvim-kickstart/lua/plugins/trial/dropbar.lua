local enabled = false
local function toggle_dropbar()
  enabled = not enabled

  -- Redraw the current winbar
  if enabled then
    vim.o.winbar = '%{%v:lua.dropbar.get_dropbar_str()%}'
  else
    vim.o.winbar = ''
  end
end

return {
  'Bekaboo/dropbar.nvim',
  keys = {
    { '<leader>td', toggle_dropbar, desc = '[T]oggle [D]ropbar' },
  },
  opts = {
    general = {
      enable = function()
        return enabled
      end,
    },
  },
}
