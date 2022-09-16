local function spec(use)
    use "wbthomason/packer.nvim" -- Packer can manage itself

    use { "lewis6991/impatient.nvim" }

    -- ======= Personal must have ========
    use {
        "ten3roberts/qf.nvim", -- Alternative to "romainl/vim-qf"
        config = function()
            require("qf").setup {}

            -- Quickfix/Location list navigation
            vim.keymap.set("n", "<Down>", function()
                require("qf").below "visible"
            end, { noremap = true })
            vim.keymap.set("n", "<Up>", function()
                require("qf").above "visible"
            end, { noremap = true })

            -- Show quickfix
            vim.keymap.set("n", "<leader>sq", function()
                require("qf").toggle("c", true)
            end, { noremap = true })
            -- Show location
            vim.keymap.set("n", "<leader>sl", function()
                require("qf").toggle("l", true)
            end, { noremap = true })
        end,
    }

    use "wincent/loupe" -- Better search use this or evanesco
    use {
        "unblevable/quick-scope",
        config = function()
            vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
        end,
    }

    -- ======= TMUX =========
    use "christoomey/vim-tmux-navigator" -- Unifies tmux and vim navigation
    use "roxma/vim-tmux-clipboard" -- Unifies vim panes in tmux sessions clipboards
    use "tmux-plugins/vim-tmux-focus-events" -- Required for vim-tmux-clipboard

    -- ======= TPOPE =========
    use "tpope/vim-repeat" -- Repeat with . sequences that use pluggins
    use "tpope/vim-sleuth" -- Automatically detect indentation
    use "tpope/vim-surround" -- Change/Add surrounding character

    -- ========= Better commenting ===========
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("valhalla.modules.comment").setup()
        end,
    }

    -- ======== Git =========
    use "tpope/vim-fugitive"
    use "rhysd/committia.vim" -- Better commits
    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("valhalla.modules.gitsigns").setup()
        end,
    }

    -- Treesitter
    if vim.fn.has "unix" == 1 then
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            requires = {
                "nvim-treesitter/playground", -- Debug treesitter
                "nvim-treesitter/nvim-treesitter-context", -- Show context at the top of the screen while scrolling
                "nvim-treesitter/nvim-treesitter-textobjects", -- Change inner function etc...
                "p00f/nvim-ts-rainbow", -- Rainbow brackets
                "JoosepAlviste/nvim-ts-context-commentstring", -- Better commenting in tsx/jsx
                "windwp/nvim-ts-autotag", -- Auto rename closing tags in html/jsx
            },
            config = function()
                require("valhalla.modules.nvim-treesitter").setup()
            end,
        }
    end

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "b0o/SchemaStore.nvim",
        "jose-elias-alvarez/null-ls.nvim", -- Support more linters/formatters
        -- Language specific packages for lsp
        {
            "folke/lua-dev.nvim",
            { "simrat39/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" },
            "jose-elias-alvarez/typescript.nvim",
        },
        {
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                require("lspsaga").init_lsp_saga {
                    symbol_in_winbar = {
                        enable = false, -- TODO: enable once this is fixed https://github.com/neovim/neovim/issues/19458 is fixed
                        separator = "  ",
                        show_file = true,
                    },
                    code_action_lightbulb = {
                        sign = true,
                        virtual_text = false,
                    },
                }
            end,
        },
        {
            "ray-x/lsp_signature.nvim",
            config = function()
                require("lsp_signature").setup {}
            end,
        },
        {
            "j-hui/fidget.nvim",
            config = function()
                require("fidget").setup {}
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

    -- NOTE: This could maybe be moved into the LSP block
    -- ======== Trouble ==========
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
            require("valhalla.modules.cmp").setup()
        end,
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "cwebster2/github-coauthors.nvim",
            "nvim-telescope/telescope-project.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = function()
            local telescope = require "valhalla.modules.telescope"
            telescope.setup()
            telescope.keymaps()
        end,
    }

    -- UI
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            {
                "mrbjarksen/neo-tree-diagnostics.nvim",
                module = "neo-tree.sources.diagnostics",
            },
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                -- only needed if you want to use the commands with "_with_window_picker" suffix
                "s1n7ax/nvim-window-picker",
                tag = "v1.*",
                config = function()
                    require("window-picker").setup {
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { "terminal" },
                            },
                        },
                        other_win_hl_color = "#e35e4f",
                    }
                end,
            },
        },
        config = function()
            local neotree = require "valhalla.modules.neotree"
            neotree.setup()
            neotree.keymaps()
        end,
    }

    use {
        "windwp/windline.nvim", -- Status line
        config = function()
            vim.o.laststatus = 3
            require("valhalla.modules.windline").setup()
        end,
    }
    use "rebelot/kanagawa.nvim" -- Theme
    use "folke/tokyonight.nvim" -- Theme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup {
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                integrations = {
                    neotree = {
                        enabled = true,
                        show_root = true,
                        transparent_panel = true,
                    },
                    ts_rainbow = true,
                },
            }
        end,
    } -- Theme
    use "navarasu/onedark.nvim" -- Theme
    use "Yazeed1s/minimal.nvim" -- Theme
    use "Yagua/nebulous.nvim" -- Theme
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
