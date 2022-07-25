local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettier, -- Use until https://github.com/williamboman/mason.nvim/pull/132 is merged
        -- null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.hadolint,
    },
    on_attach = require "valhalla.configs.lsp.on-attach",
}
