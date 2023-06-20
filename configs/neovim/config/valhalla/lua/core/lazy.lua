local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup {
    spec = { import = "plugins" },
    dev = {
        -- directory where you store your local plugin projects
        path = "~/",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {},    -- For example {"folke"}
        fallback = false, -- Fallback to git when local plugin doesn't exist
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "tar",
                "tarPlugin",
                "zip",
                "zipPlugin",
                "getscript",
                "getscriptPlugin",
                "vimball",
                "vimballPlugin",
                "matchit",
                "matchparen",
                "2html_plugin",
                "logiPat",
                "rrhelper",
                "man",
                "netrwPlugin",
                "tutor",
            },
        },
    },
}
