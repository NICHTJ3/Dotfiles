local plugin = require("core.pack").register_plugin

plugin {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
}

plugin {
    "jose-elias-alvarez/null-ls.nvim", -- Support more linters/formatters
    config = function()
        local config = require "modules.lsp.config.null-ls"
        config.setup()
    end,
}

-- Language specific packages for lsp
plugin {
    "folke/neodev.nvim",
    "b0o/SchemaStore.nvim",
    { "simrat39/rust-tools.nvim", branch = "modularize_and_inlay_rewrite", ft = { "rust" } },
    "jose-elias-alvarez/typescript.nvim",
    "Hoffs/omnisharp-extended-lsp.nvim",
}

plugin {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup {
            symbol_in_winbar = {
                enable = true,
                separator = "  ",
                show_file = true,
            },
            code_action_lightbulb = {
                sign = true,
                virtual_text = false,
            },
        }
    end,
}
-- LSP
plugin {
    "neovim/nvim-lspconfig",
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup {}
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            vim.g.symbols_outline = {
                position = "right",
                auto_preview = false,
                keymaps = { -- These keymaps can be a string or a table for multiple keys
                    close = { "<Esc>", "q" },
                    goto_location = "gd",
                    focus_location = "<CR>",
                    hover_symbol = "<C-space>",
                    toggle_preview = "K",
                    rename_symbol = "r",
                    code_actions = "a",
                },
            }
        end,
    },
}

plugin {
    "vigoux/notifier.nvim",
    config = function()
        require("notifier").setup {
            -- You configuration here
        }
    end,
}

-- CMP
plugin {
    -- "hrsh7th/nvim-cmp",
    "williamboman/nvim-cmp",
    branch = "feat/docs-preview-window",
    requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-path",
        "andersevenrud/cmp-tmux",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "petertriho/cmp-git",
        {
            "L3MON4D3/LuaSnip",
            requires = { "rafamadriz/friendly-snippets" },
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        {
            "onsails/lspkind-nvim",
            config = function()
                require("lspkind").init()
            end,
        },
    },
    config = function()
        require("modules.lsp.config.cmp").setup()
    end,
}

-- ======== Trouble ==========
plugin {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("trouble").setup {}
        vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })
    end,
}
