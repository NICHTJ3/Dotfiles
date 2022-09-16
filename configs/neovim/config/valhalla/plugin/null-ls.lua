local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettierd.with({
            extra_filetypes = { "astro" },
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.markdownlint,
    },
    on_attach = require "valhalla.modules.lsp.on-attach",
}
