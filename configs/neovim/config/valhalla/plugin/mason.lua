local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    return
end

mason.setup {
    max_concurrent_installers = 10,
    -- log_level = vim.log.levels.TRACE,
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    },
}

local mason_tool_installer_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_installer_ok then
    return
end

mason_tool_installer.setup {
    -- a list of all tools you want to ensure are installed upon
    -- start; they should be the names Mason uses for each tool
    ensure_installed = {
        "hadolint",
        "dockerfile-language-server",
        "eslint-lsp",
        "graphql-language-service-cli",
        "json-lsp",
        "lua-language-server",
        "prettierd",
        "prisma-language-server",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vim-language-server",
        "stylua",
        "editorconfig-checker",
        "luacheck",
        "shellcheck",
        "shfmt",
        "vint",
    },
}
