local formattable_file_types =
require('sv.configs.formatter.utils').formattable_file_types

vim.fn.sign_define("LspDiagnosticsSignError", {
    texthl = "LspDiagnosticsSignError",
    text = "",
    numhl = "LspDiagnosticsSignError"
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
    texthl = "LspDiagnosticsSignWarning",
    text = "",
    numhl = "LspDiagnosticsSignWarning"
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
    texthl = "LspDiagnosticsSignHint",
    text = "",
    numhl = "LspDiagnosticsSignHint"
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
    texthl = "LspDiagnosticsSignInformation",
    text = "",
    numhl = "LspDiagnosticsSignInformation"
})

-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = "", spacing = 0 },
    -- virtual_text = false,
    signs = true,
    underline = false
})

local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    -- Register client for messages and set up buffer autocommands to update
    -- the statusline and the current function.
    -- NOTE: on_attach is called with the client object, which is the "client" parameter below
    require('lsp-status').on_attach(client)

    local opts = { noremap = true, silent = true }
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>agr', '<cmd>lua vim.lsp.buf.references()<CR>',
        opts)
    buf_set_keymap('n', '<leader>agi',
        '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>agt',
        '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    buf_set_keymap('n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    buf_set_keymap('n', '<leader>aa', '<cmd>Lspsaga code_action<CR>', opts)
    buf_set_keymap('n', '<leader>ai', '<cmd>Lspsaga show_line_diagnostics<CR>',
        opts)
    buf_set_keymap('n', '<leader>or', '<cmd>OrganizeImports<CR>', opts)
    buf_set_keymap('n', '<leader>q',
        '<cmd>Trouble lsp_document_diagnostics<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    -- scroll down hover doc or scroll in definition preview
    buf_set_keymap('n', '<C-f>',
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
        opts)
    -- scroll up hover doc
    buf_set_keymap('n', '<C-b>',
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
        opts)

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.documentFormattingProvider then
        -- If we have a formatter defined by formattable_file_types then use
        -- that too
        if not formattable_file_types[vim.bo.filetype] == nil then
            vim.cmd [[ command! MyFormat :lua vim.lsp.buf.format({}, 2000); vim.cmd "Format" <CR> ]]
            buf_set_keymap("n", "<leader>d", "<cmd>MyFormat<CR>", opts)
        else
            buf_set_keymap("n", "<leader>d",
                "<cmd>lua vim.lsp.buf.format({}, 2000)<CR>",
                opts)
        end
    end

    if client.server_capabilities.documentRangeFormattingProvider then
        buf_set_keymap("v", "<leader>d",
            "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    if client.server_capabilities.documentHighlightProvider then
        -- NOTE: Currently this below section does nothing. I probably want to
        -- update it to highlight vars like vscode
    end
end

return lsp_config