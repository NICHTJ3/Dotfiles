---@class core.util.lsp
local M = {}

---@param on_attach fun(client:vim.lsp.Client, buffer)
---@param name? string
function M.on_attach(on_attach, name)
  return vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local buffer = args.buf ---@type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and (not name or client.name == name) then
        return on_attach(client, buffer)
      end
    end,
  })
end

---@type table<string, table<vim.lsp.Client, table<number, boolean>>>
M._supports_method = {}

---@param opts? vim.lsp.get_clients.Filter
function M.get_clients(opts)
  local ret = {} ---@type vim.lsp.Client[]
  if vim.lsp.get_clients then
    ret = vim.lsp.get_clients(opts)
  else
    ---@diagnostic disable-next-line: deprecated
    ret = vim.lsp.get_active_clients(opts)
    if opts and opts.method then
      ---@param client vim.lsp.Client
      ret = vim.tbl_filter(function(client)
        return client.supports_method(opts.method, { bufnr = opts.bufnr })
      end, ret)
    end
  end
  ---@diagnostic disable-next-line: undefined-field
  return opts and opts.filter and vim.tbl_filter(opts.filter, ret) or ret
end

---@param from string
---@param to string
---@param rename? fun()
function M.on_rename(from, to, rename)
  local changes = { files = { {
    oldUri = vim.uri_from_fname(from),
    newUri = vim.uri_from_fname(to),
  } } }

  local clients = M.get_clients()
  for _, client in ipairs(clients) do
    if client.supports_method 'workspace/willRenameFiles' then
      local resp = client.request_sync('workspace/willRenameFiles', changes, 1000, 0)
      if resp and resp.result ~= nil then
        vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)
      end
    end
  end

  if rename then
    rename()
  end

  for _, client in ipairs(clients) do
    if client.supports_method 'workspace/didRenameFiles' then
      client.notify('workspace/didRenameFiles', changes)
    end
  end
end

--- @return lspconfig.Config
function M.get_config(server)
  local configs = require 'lspconfig.configs'
  return rawget(configs, server)
end

function M.is_enabled(server)
  local config = M.get_config(server)
  return config and config.enabled ~= false
end

---@param server string
---@param cond fun( root_dir, config): boolean
function M.disable(server, cond)
  local util = require 'lspconfig.util'
  local def = M.get_config(server)
  ---@diagnostic disable-next-line: undefined-field
  def.document_config.on_new_config = util.add_hook_before(def.document_config.on_new_config, function(config, root_dir)
    if cond(root_dir, config) then
      config.enabled = false
    end
  end)
end

---@param fn fun(client:vim.lsp.Client, buffer):boolean?
---@param opts? {group?: integer}
function M.on_dynamic_capability(fn, opts)
  return vim.api.nvim_create_autocmd('User', {
    pattern = 'LspDynamicCapability',
    group = opts and opts.group or nil,
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      local buffer = args.data.buffer ---@type number
      if client then
        return fn(client, buffer)
      end
    end,
  })
end

---@param method string
---@param fn fun(client:vim.lsp.Client, buffer)
function M.on_supports_method(method, fn)
  M._supports_method[method] = M._supports_method[method] or setmetatable({}, { __mode = 'k' })
  return vim.api.nvim_create_autocmd('User', {
    pattern = 'LspSupportsMethod',
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      local buffer = args.data.buffer ---@type number
      if client and method == args.data.method then
        return fn(client, buffer)
      end
    end,
  })
end

---@param client vim.lsp.Client
function M._check_methods(client, buffer)
  -- don't trigger on invalid buffers
  if not vim.api.nvim_buf_is_valid(buffer) then
    return
  end
  -- don't trigger on non-listed buffers
  if not vim.bo[buffer].buflisted then
    return
  end
  -- don't trigger on nofile buffers
  if vim.bo[buffer].buftype == 'nofile' then
    return
  end
  for method, clients in pairs(M._supports_method) do
    clients[client] = clients[client] or {}
    if not clients[client][buffer] then
      if client.supports_method and client.supports_method(method, { bufnr = buffer }) then
        clients[client][buffer] = true
        vim.api.nvim_exec_autocmds('User', {
          pattern = 'LspSupportsMethod',
          data = { client_id = client.id, buffer = buffer, method = method },
        })
      end
    end
  end
end

---@class LspCommand: lsp.ExecuteCommandParams
---@field open? boolean
---@field handler? lsp.Handler

---@param opts LspCommand
function M.execute(opts)
  local params = {
    command = opts.command,
    arguments = opts.arguments,
  }
  if opts.open then
    require('trouble').open {
      mode = 'lsp_command',
      params = params,
    }
  else
    return vim.lsp.buf_request(0, 'workspace/executeCommand', params, opts.handler)
  end
end

M.action = setmetatable({}, {
  __index = function(_, action)
    return function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { action },
          diagnostics = {},
        },
      }
    end
  end,
})

function M.setup()
  local register_capability = vim.lsp.handlers['client/registerCapability']

  vim.lsp.handlers['client/registerCapability'] = function(err, res, ctx)
    ---@diagnostic disable-next-line: no-unknown
    local ret = register_capability(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if client then
      for buffer in pairs(client.attached_buffers) do
        vim.api.nvim_exec_autocmds('User', {
          pattern = 'LspDynamicCapability',
          data = { client_id = client.id, buffer = buffer },
        })
      end
    end
    return ret
  end

  M.on_attach(M._check_methods)
  M.on_dynamic_capability(M._check_methods)
end

---@alias LspWord {from:{[1]:number, [2]:number}, to:{[1]:number, [2]:number}} 1-0 indexed
M.words = {}
M.words.ns = vim.api.nvim_create_namespace 'vim_lsp_references'

---@param opts? {enabled?: boolean}
function M.words.setup(opts)
  opts = opts or {}
  if not opts.enabled then
    return
  end
  M.words.enabled = true
  local handler = vim.lsp.handlers['textDocument/documentHighlight']
  vim.lsp.handlers['textDocument/documentHighlight'] = function(err, result, ctx, config)
    if not vim.api.nvim_buf_is_loaded(ctx.bufnr) then
      return
    end
    vim.lsp.buf.clear_references()
    return handler(err, result, ctx, config)
  end

  M.on_supports_method('textDocument/documentHighlight', function(_, buf)
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI', 'CursorMoved', 'CursorMovedI' }, {
      group = vim.api.nvim_create_augroup('lsp_word_' .. buf, { clear = true }),
      buffer = buf,
      callback = function(ev)
        if not require('plugins.lsp.keymaps').has(buf, 'documentHighlight') then
          return false
        end
        if not ({ M.words.get() })[2] then
          if ev.event:find 'CursorMoved' then
            vim.lsp.buf.clear_references()
          elseif not Core.cmp.visible() then
            vim.lsp.buf.document_highlight()
          end
        end
      end,
    })
  end)
end

---@return LspWord[] words, number? current
function M.words.get()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local current, ret = nil, {} ---@type number?, LspWord[]
  for _, extmark in ipairs(vim.api.nvim_buf_get_extmarks(0, M.words.ns, 0, -1, { details = true })) do
    local w = {
      from = { extmark[2] + 1, extmark[3] },
      to = { extmark[4].end_row + 1, extmark[4].end_col },
    }
    ret[#ret + 1] = w
    if cursor[1] >= w.from[1] and cursor[1] <= w.to[1] and cursor[2] >= w.from[2] and cursor[2] <= w.to[2] then
      current = #ret
    end
  end
  return ret, current
end

return M
