-- TODO: Make plugins opt where possible
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            {
                'ray-x/lsp_signature.nvim',
                config = function()
                    require'lsp_signature'.on_attach(
                        {
                            fix_pos = true, -- set to true, the floating window will not auto-close until finish all parameters
                            use_lspsaga = true -- set to true if you want to use lspsaga popup
                        })

                end
            }, {
                'hrsh7th/nvim-compe',
                config = function()
                    require('sv.configs.lsp.compe')
                end
            }, {
                'williamboman/nvim-lsp-installer',
                requires = {{'neovim/nvim-lspconfig'}},
                config = function()
                    require('sv.configs.lsp.lspinstaller')
                end
            }, {'glepnir/lspsaga.nvim'}, {
                "mhartington/formatter.nvim", -- Helper for fast formatting
                config = function()
                    require 'sv.configs.formatter'
                end
            }
        }
    }

    -- Telescope/Fuzzy finding
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            {'cwebster2/github-coauthors.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

        },
        config = function() require 'sv.configs.telescope' end
    }

    -- Trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup {} end
    }

    -- Snippets and Syntax
    use {
        'hrsh7th/vim-vsnip',
        requires = {{'rafamadriz/friendly-snippets'}},
        config = function() require('sv.configs.vsnip') end
    }
    -- use 'sheerun/vim-polyglot' -- Note: I should remove this and enable tree sitter once jsx is fixed
    -- Treesitter
    use 'pantharshit00/vim-prisma'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            {'JoosepAlviste/nvim-ts-context-commentstring'},
            {'p00f/nvim-ts-rainbow'},
            {'nvim-treesitter/nvim-treesitter-textobjects'}
        },
        config = function() require 'sv.configs.nvim-treesitter' end
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'kdheepak/lazygit.nvim' -- Lazygit in vim?
    use 'rhysd/committia.vim' -- Better commits
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('sv.configs.gitsigns') end
    }

    -- Fixes
    use 'romainl/vim-qf' -- Fixes issues with built in quick fix menu
    use 'tpope/vim-repeat' -- Repeat with . sequences that use pluggins
    use 'zoubin/vim-gotofile' -- Better go to file
    use 'pgdouyon/vim-evanesco' -- Clears search highlighting on move

    -- Must have plugins
    use {'tjdevries/astronauta.nvim'} -- Use until [https://github.com/neovim/neovim/pull/13823] is merged
    use {
        'unblevable/quick-scope',
        config = function() require('sv.configs.quickscope') end
    }
    use {
        'marcushwz/nvim-workbench',
        config = function() require('sv.configs.nvim-workbench') end
    }
    use 'tpope/vim-surround' -- Change/Add surrounding character
    use 'tpope/vim-sleuth' -- Automatically detect indentation
    use {
        'b3nj5m1n/kommentary', -- Toggle comments
        config = function()
            require('kommentary.config').configure_language('typescriptreact', {
                single_line_comment_string = 'auto',
                multi_line_comment_strings = 'auto',
                hook_function = function()
                    require('ts_context_commentstring.internal').update_commentstring()
                end
            })
        end

    }
    -- use 'AndrewRadev/tagalong.vim'
    use {
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup {} end
    }

    -- TMUX
    use 'christoomey/vim-tmux-navigator' -- Unifies tmux and vim navigation
    use 'roxma/vim-tmux-clipboard' -- Unifies vim panes in tmux sessions clipboards
    use 'tmux-plugins/vim-tmux-focus-events' -- Required for vim-tmux-clipboard

    -- Note taking
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        config = function() require('sv.configs.markdown-preview') end
    }

    -- UI
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("bufferline").setup {
                offsets = {
                    {
                        filetype = "nerdtree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left"
                    }
                }
            }
        end
    }

    use {
        'glepnir/dashboard-nvim',
        config = function() require("sv.configs.dashboard") end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require 'sv.configs.nvimtree' end
    }
    use {
        'glepnir/galaxyline.nvim', -- Status line
        branch = 'main',
        config = function() require 'sv.configs.galaxyline' end,
        requires = {
            {'kyazdani42/nvim-web-devicons', opt = true},
            {'nvim-lua/lsp-status.nvim'} -- For git information
        }
    }
    use 'folke/tokyonight.nvim' -- Theme
    use {
        'miyakogi/seiya.vim', -- Transparency automagically
        config = function() require('sv.configs.seiya') end
    }
end)
