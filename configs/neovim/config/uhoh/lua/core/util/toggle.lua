---@class core.util.toggle
local M = {}

---@class core.Toggle
---@field name string
---@field get fun():boolean
---@field set fun(state:boolean)

---@class core.Toggle.wrap: core.Toggle
---@operator call:boolean
------@param toggle core.Toggle
function M.wrap(toggle)
  return setmetatable(toggle, {
    __call = function()
      toggle.set(not toggle.get())
      local state = toggle.get()
      if state then
        Core.info('Enabled ' .. toggle.name, { title = toggle.name })
      else
        Core.warn('Disabled ' .. toggle.name, { title = toggle.name })
      end
      return state
    end,
  }) --[[@as core.Toggle.wrap]]
end

function M.wk(lhs, toggle)
  if not Core.has 'which-key.nvim' then
    return
  end
  local function safe_get()
    local ok, enabled = pcall(toggle.get)
    if not ok then
      Core.error({ 'Failed to get toggle state for **' .. toggle.name .. '**:\n', enabled }, { once = true })
    end
    return enabled
  end
  require('which-key').add {
    {
      lhs,
      icon = function()
        return safe_get() and { icon = ' ', color = 'green' } or { icon = ' ', color = 'yellow' }
      end,
      desc = function()
        return (safe_get() and 'Disable ' or 'Enable ') .. toggle.name
      end,
    },
  }
end

---@param lhs string
---@param toggle core.Toggle
function M.map(lhs, toggle)
  local t = M.wrap(toggle)
  vim.keymap.set('n', lhs, function()
    t()
  end, { desc = 'Toggle ' .. toggle.name })
  M.wk(lhs, toggle)
end

---@param opts? {values?: {[1]:any, [2]:any}, name?: string}
function M.option(option, opts)
  opts = opts or {}
  local name = opts.name or option
  local on = opts.values and opts.values[2] or true
  local off = opts.values and opts.values[1] or false
  return M.wrap {
    name = name,
    get = function()
      return vim.opt_local[option]:get() == on
    end,
    set = function(state)
      vim.opt_local[option] = state and on or off
    end,
  }
end

M.inlay_hints = M.wrap {
  name = 'Inlay Hints',
  get = function()
    return vim.lsp.inlay_hint.is_enabled { bufnr = 0 }
  end,
  set = function(state)
    vim.lsp.inlay_hint.enable(state, { bufnr = 0 })
  end,
}

setmetatable(M, {
  __call = function(m, ...)
    return m.option(...)
  end,
})

return M
