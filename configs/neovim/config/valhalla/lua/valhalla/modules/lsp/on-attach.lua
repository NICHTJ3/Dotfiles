local ts_utils = require "nvim-treesitter.ts_utils"
local lsp_signature = require "lsp_signature"
local telescope_lsp = require "valhalla.modules.telescope.lsp"

vim.fn.sign_define("DiagnosticSignError", {
    texthl = "DiagnosticSignError",
    text = "",
    numhl = "DiagnosticSignError",
})
vim.fn.sign_define("DiagnosticSignWarning", {
    texthl = "DiagnosticSignWarning",
    text = "",
    numhl = "DiagnosticSignWarning",
})
vim.fn.sign_define("DiagnosticSignHint", {
    texthl = "DiagnosticSignHint",
    text = "",
    numhl = "DiagnosticSignHint",
})
vim.fn.sign_define("DiagnosticSignInformation", {
    texthl = "DiagnosticSignInformation",
    text = "",
    numhl = "DiagnosticSignInformation",
})

local function highlight_references()
    local node = ts_utils.get_node_at_cursor()
    while node ~= nil do
        local node_type = node:type()
        if node_type == "string"
            or node_type == "string_fragment"
            or node_type == "template_string"
            or node_type == "document" -- for inline gql`` strings
        then
            -- who wants to highlight a string? i don't. yuck
            return
        end
        node = node:parent()
    end
    vim.lsp.buf.document_highlight()
end

--- @return fun() @function that calls the provided fn, but with no args
local function w(fn)
    return function()
        return fn()
    end
end

---@param bufnr number
local function buf_autocmd_document_highlight(bufnr)
    local group = vim.api.nvim_create_augroup("lsp_document_highlight", {})
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        group = group,
        callback = highlight_references,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = bufnr,
        group = group,
        callback = w(vim.lsp.buf.clear_references),
    })
end

---@param bufnr number
local function buf_autocmd_codelens(bufnr)
    local group = vim.api.nvim_create_augroup("lsp_document_codelens", {})
    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost", "CursorHold" }, {
        buffer = bufnr,
        group = group,
        callback = w(vim.lsp.codelens.refresh),
    })
end

-- Finds and runs the closest codelens (searches upwards only)
local function find_and_run_codelens()
    local bufnr = vim.api.nvim_get_current_buf()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

    local lenses = vim.tbl_filter(function(lense)
        return lense.range.start.line < row
    end, vim.lsp.codelens.get(bufnr)) or {}

    if #lenses == 0 then
        return vim.notify "Could not find codelens to run."
    end

    table.sort(lenses, function(a, b)
        return a.range.start.line > b.range.start.line
    end)

    vim.api.nvim_win_set_cursor(0, { lenses[1].range.start.line + 1, lenses[1].range.start.character })
    vim.lsp.codelens.run()
    vim.api.nvim_win_set_cursor(0, { row, col }) -- restore cursor, TODO: also restore position
end

local function merge(t1, t2)
    for k, v in ipairs(t2) do
        table.insert(t1, v)
    end

    return t1
end

---@param bufnr number
local function buf_set_keymaps(bufnr)
    local function buf_set_keymap(mode, lhs, rhs, opts)
        vim.keymap.set(mode, lhs, rhs, merge({ buffer = bufnr, silent = true }, opts or {}))
    end

    buf_set_keymap("n", "<leader>d", function()
        vim.lsp.buf.formatting()
    end)

    -- Code actions
    local codeactions = require "lspsaga.codeaction"

    buf_set_keymap("n", "<leader>ar", require("lspsaga.rename").lsp_rename)
    buf_set_keymap("n", "<leader>aa", codeactions.code_action, { noremap = true })
    buf_set_keymap("v", "<leader>aa", function()
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
        codeactions.range_code_action()
    end, { noremap = true })
    buf_set_keymap("n", "<leader>l", find_and_run_codelens)
    buf_set_keymap("n", "<leader>or", "<cmd>OrganizeImports<CR>")

    -- Preview diagnostic messages
    buf_set_keymap("n", "<leader>ai", require("lspsaga.diagnostic").show_line_diagnostics)

    -- Movement
    buf_set_keymap("n", "gd", vim.lsp.buf.definition)
    buf_set_keymap("n", "gD", vim.lsp.buf.declaration)

    buf_set_keymap("n", "gr", telescope_lsp.references)
    buf_set_keymap("n", "gI", telescope_lsp.implementations)
    buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    buf_set_keymap("n", "<leader>ls", telescope_lsp.document_symbols)

    -- Docs
    -- show hover doc and press twice will jumpto hover window
    buf_set_keymap("n", "K", require("lspsaga.hover").render_hover_doc)

    -- FIXME: Scrolling is not working for some reason 🤦
    -- scroll down hover doc or scroll in definition preview
    local sagaactions = require "lspsaga.action"
    vim.keymap.set("n", "<C-f>", function()
        sagaactions.smart_scroll_with_saga(1)
    end)
    -- scroll up hover doc
    vim.keymap.set("n", "<C-b>", function()
        sagaactions.smart_scroll_with_saga(-1)
    end)
end

return function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    buf_set_keymaps(bufnr)

    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end

    if client.supports_method "textDocument/documentHighlight" then
        buf_autocmd_document_highlight(bufnr)
    end

    if client.supports_method "textDocument/codeLens" then
        buf_autocmd_codelens(bufnr)
        vim.schedule(vim.lsp.codelens.refresh)
    end

    lsp_signature.on_attach({
        bind = true,
        floating_window = false,
        hint_prefix = "",
        hint_scheme = "Comment",
    }, bufnr)
end
