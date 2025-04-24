---@class core.util.cmp
local M = {}

---@alias core.util.cmp.Action fun():boolean?
---@type table<string, core.util.cmp.Action>
M.actions = {
  -- Native Snippets
  snippet_forward = function()
    if vim.snippet.active { direction = 1 } then
      vim.schedule(function()
        vim.snippet.jump(1)
      end)
      return true
    end
  end,
}

---@param actions string[]
---@param fallback? string|fun()
function M.map(actions, fallback)
  return function()
    for _, name in ipairs(actions) do
      if M.actions[name] then
        local ret = M.actions[name]()
        if ret then
          return true
        end
      end
    end
    return type(fallback) == 'function' and fallback() or fallback
  end
end

function M.visible()
  ---@module 'cmp'
  local cmp = package.loaded['cmp']
  return cmp and cmp.core.view:visible()
end

return M
