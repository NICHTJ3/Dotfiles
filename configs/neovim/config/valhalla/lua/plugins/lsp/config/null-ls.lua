local null_ls = require "null-ls"

local M = {}

function M.setup()
    null_ls.setup {
        sources = {
            null_ls.builtins.formatting.prettier.with {
                extra_filetypes = { "astro" },
            },
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.diagnostics.shellcheck,
            null_ls.builtins.diagnostics.hadolint,
            null_ls.builtins.diagnostics.gitlint,
            null_ls.builtins.diagnostics.markdownlint,
        },
        on_attach = require "plugins.lsp.on-attach",
    }
end

return M
