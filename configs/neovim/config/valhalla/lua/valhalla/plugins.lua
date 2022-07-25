local function spec(use)
    use "wbthomason/packer.nvim" -- Packer can manage itself

    use { "lewis6991/impatient.nvim" }

    -- Personal must have
    -- TMUX
    use "christoomey/vim-tmux-navigator" -- Unifies tmux and vim navigation
    use "roxma/vim-tmux-clipboard" -- Unifies vim panes in tmux sessions clipboards
    use "tmux-plugins/vim-tmux-focus-events" -- Required for vim-tmux-clipboard
    use "romainl/vim-qf" -- Fixes issues with built in quick fix menu
    use "tpope/vim-repeat" -- Repeat with . sequences that use pluggins
    use "wincent/loupe" -- Better search use this or evanesco
    use "tpope/vim-surround" -- Change/Add surrounding character
    use "tpope/vim-sleuth" -- Automatically detect indentation
    use {
        "unblevable/quick-scope",
        config = function()
            vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
        end,
    }
    use {
        "numToStr/Comment.nvim",
        config = function()
            require "valhalla.configs.comment"
        end,
    }
    use { "AndrewRadev/tagalong.vim", ft = { "typescriptreact", "html", "vue" } }

    -- Git
    use "tpope/vim-fugitive"
    use "rhysd/committia.vim" -- Better commits
    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("valhalla.configs.gitsigns").Setup()
        end,
    }

    -- Treesitter
    if vim.fn.has "unix" == 1 then
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            requires = {
                "nvim-treesitter/playground",
                "nvim-treesitter/nvim-treesitter-context",
                "nvim-treesitter/nvim-treesitter-textobjects",
                "p00f/nvim-ts-rainbow",
                "JoosepAlviste/nvim-ts-context-commentstring",
                "windwp/nvim-ts-autotag",
            },
            config = function()
                require("valhalla.configs.nvim-treesitter").setup()
            end,
        }
    end

    -- LSP
    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").init_lsp_saga()
        end,
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/lua-dev.nvim",
        "neovim/nvim-lspconfig",
        "b0o/SchemaStore.nvim",
        "ray-x/lsp_signature.nvim",
        { "simrat39/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" },
        "jose-elias-alvarez/null-ls.nvim",
        "jose-elias-alvarez/typescript.nvim",
        "j-hui/fidget.nvim",
    }

    -- Trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
            vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })
        end,
    }

    -- CMP
    use {
        -- "hrsh7th/nvim-cmp",
        "williamboman/nvim-cmp",
        branch = "feat/docs-preview-window",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-path",
            "andersevenrud/cmp-tmux",
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
            require("valhalla.configs.cmp").setup()
        end,
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-project.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = function()
            require("valhalla.configs.telescope").setup()
        end,
    }

    -- UI
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("valhalla.configs.nvimtree").Setup()
        end,
    }
    use {
        "windwp/windline.nvim", -- Status line
        config = function()
            vim.o.laststatus = 3
            require("valhalla.configs.windline").setup()
        end,
    }
    use "rebelot/kanagawa.nvim" -- Theme
    use "folke/tokyonight.nvim" -- Theme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup {
                integration = {
                    nvimtree = {
                        enabled = true,
                        show_root = true, -- makes the root folder not transparent
                        transparent_panel = false, -- make the panel transparent
                    },
                },
            }
        end,
    } -- Theme
end

require("packer").startup {
    spec,
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
        max_jobs = vim.fn.has "win32" == 1 and 5 or nil,
    },
}
