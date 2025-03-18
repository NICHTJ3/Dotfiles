---@class core.util.events
local M = {}

function M.add_lazy_file_event()
  -- NOTE: Quick file opening used to be handled here but is now handled by Snacks.nvim

  -- Add support for the LazyFile event
  local Event = require 'lazy.core.handler.event'

  Event.mappings.LazyFile = { id = 'LazyFile', event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' } }
  Event.mappings['User LazyFile'] = Event.mappings.LazyFile
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
      fn()
    end,
  })
end

return M
