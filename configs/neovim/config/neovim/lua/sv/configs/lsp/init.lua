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

-- TODO: This is not working.. Fix this
vim.cmd(
    'command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {prefix = "", spacing = 0},
        signs = true,
        underline = true
    })

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ", "   (Method)", "   (Function)",
    "   (Constructor)", " ﴲ  (Field)", "[] (Variable)", "   (Class)",
    " ﰮ  (Interface)", "   (Module)", " 襁 (Property)", "   (Unit)",
    "   (Value)", " 練 (Enum)", "   (Keyword)", "   (Snippet)",
    "   (Color)", "   (File)", "   (Reference)", "   (Folder)",
    "   (EnumMember)", " ﲀ  (Constant)", " ﳤ  (Struct)", "   (Event)",
    "   (Operator)", "   (TypeParameter)"
}

local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    print("LSP Attatched")
    local opts = {noremap = true, silent = true}
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    buf_set_keymap('n', '<leader>agD', '<Cmd>lua vim.lsp.buf.declaration()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>agd', '<Cmd>lua vim.lsp.buf.definition()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>agr', '<cmd>lua vim.lsp.buf.references()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>agi',
                   '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>agt',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    buf_set_keymap('n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>aa', '<cmd>Lspsaga code_action<CR>', opts)
    buf_set_keymap('n', '<leader>ai',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>q',
                   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
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
    if client.resolved_capabilities.document_formatting then
        -- If we have a formatter defined by formattable_file_types then use
        -- that only
        if formattable_file_types[vim.bo.filetype] == nil then
            buf_set_keymap("n", "<space>d",
                           "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        end

    end
    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<space>d",
                       "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceText cterm=bold ctermbg=red guibg=0
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
end

return lsp_config
