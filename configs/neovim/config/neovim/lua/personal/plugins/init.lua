vim.o.completeopt = "menuone,noselect"

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lsp'
    use {'neovim/nvim-lspconfig', requires = {{'neovim/nvim-lsp'}}}
    use {
        'kabouzeid/nvim-lspinstall',
        requires = {{'neovim/nvim-lspconfig'}},
        config = function() require('personal.plugins.lspinstall') end
    }
    use {'hrsh7th/nvim-compe',config = function() require('personal.plugins.compe')end}
    use 'glepnir/lspsaga.nvim'

    -- Telescope/Fuzzy finding
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require 'personal.plugins.telescope' end
    }
    use {
        'nvim-telescope/telescope-fzy-native.nvim',
        requires = {{'nvim-telescope/telescope.nvim'}}
    }

    -- Snippets and Syntax
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'pantharshit00/vim-prisma'
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require 'personal.plugins.nvim-treesitter' end
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

    -- Must have plugins
    use {
        'folke/todo-comments.nvim',
        config = function() require 'personal.plugins.todo-comments' end
    }
    use {
        'unblevable/quick-scope',
        config = function() require('personal.plugins.quickscope') end
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
        config = function() require('personal.plugins.markdown-preview') end
    }

    -- UI
    use {
        'glepnir/dashboard-nvim',
        config = function() require("personal.plugins.dashboard") end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require("personal.plugins.nvim-tree") end
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = {{'kyazdani42/nvim-web-devicons', opt = true}},
        config = function() require 'personal.plugins.lua-line' end
    }
    use 'folke/tokyonight.nvim'
    use {
        'miyakogi/seiya.vim', -- Transparency automagically
        config = function() require('personal.plugins.seiya') end
    }

end)
