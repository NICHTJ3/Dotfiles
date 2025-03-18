---@class core.util.cmp
local M = {}

function M.visible()
  ---@module 'cmp'
  local cmp = package.loaded["cmp"]
  return cmp and cmp.core.view:visible()
end

return M
