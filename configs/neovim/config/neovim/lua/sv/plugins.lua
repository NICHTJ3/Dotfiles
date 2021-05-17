vim.o.completeopt = "menuone,noselect"

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use {
        'neovim/nvim-lsp',
        requires = {
            {'neovim/nvim-lspconfig', requires = {{'neovim/nvim-lsp'}}}, {
                'hrsh7th/nvim-compe',
                config = function()
                    require('sv.configs.lsp.compe')
                end
            }, {
                'kabouzeid/nvim-lspinstall',
                requires = {{'neovim/nvim-lspconfig'}},
                config = function()
                    require('sv.configs.lsp.lspinstall')
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
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require 'sv.configs.telescope' end
    }
    use {
        'nvim-telescope/telescope-fzy-native.nvim',
        requires = {{'nvim-telescope/telescope.nvim'}}
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
        requires = {
            {'hrsh7th/vim-vsnip-integ'}, {'rafamadriz/friendly-snippets'}
        },
        config = function() require('sv.configs.vsnip') end
    }
    use 'pantharshit00/vim-prisma'
    vim.g['polyglot_disabled'] = {'coffee-script'}
    use 'sheerun/vim-polyglot'
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require 'sv.configs.nvim-treesitter' end
    }
    use {
        'p00f/nvim-ts-rainbow',
        requires = {{'nvim-treesitter/nvim-treesitter'}}
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'rhysd/committia.vim' -- Better commits
    use 'airblade/vim-gitgutter'

    -- Fixes
    use 'romainl/vim-qf' -- Fixes issues with built in quick fix menu
    use 'tpope/vim-repeat' -- Repeat with . sequences that use pluggins
    use 'zoubin/vim-gotofile' -- Better go to file
    use 'pgdouyon/vim-evanesco' -- Clears search highlighting on move

    -- Must have configs
    use {
        'unblevable/quick-scope',
        config = function() require('sv.configs.quickscope') end
    }
    use 'tpope/vim-surround' -- Change/Add surrounding character
    use 'tpope/vim-sleuth' -- Automatically detect indentation
    use 'wincent/pinnacle' -- Manipulate highlight groups in lua
    use 'tpope/vim-commentary' -- Toggle comments
    use 'AndrewRadev/tagalong.vim'

    -- TMUX
    use 'christoomey/vim-tmux-navigator' -- Unifies tmux and vim navigation
    use 'roxma/vim-tmux-clipboard' -- Unifies vim panes in tmux sessions clipboards
    use 'tmux-plugins/vim-tmux-focus-events' -- Required for vim-tmux-clipboard

    -- Note taking
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview',
        config = function() require('sv.configs.markdown-preview') end
    }

    -- UI
    use {
        'glepnir/dashboard-nvim',
        config = function() require("sv.configs.dashboard") end
    }
    use {
        'preservim/nerdtree',
        requires = {
            {
                'tiagofumo/vim-nerdtree-syntax-highlight',
                requires = {{'ryanoasis/vim-devicons'}}
            }, {'PhilRunninger/nerdtree-buffer-ops'},
            {'PhilRunninger/nerdtree-visual-selection'},
            {'Xuyuanp/nerdtree-git-plugin'}
        },
        config = function() require("sv.configs.nerdtree") end
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = {{'kyazdani42/nvim-web-devicons', opt = true}},
        config = function() require 'sv.configs.lua-line' end
    }
    use 'folke/tokyonight.nvim'
    use {
        'miyakogi/seiya.vim', -- Transparency automagically
        config = function() require('sv.configs.seiya') end
    }

end)
