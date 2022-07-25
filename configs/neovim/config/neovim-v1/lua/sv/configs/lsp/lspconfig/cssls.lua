local cssCapabilities = vim.lsp.protocol.make_client_capabilities()
cssCapabilities.textDocument.completion.completionItem.snippetSupport = true
local M = {}

M.config = {capabilities = cssCapabilities}

return M
