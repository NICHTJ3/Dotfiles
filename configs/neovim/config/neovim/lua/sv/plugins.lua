return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use {
        'williamboman/nvim-lsp-installer',
        requires = {'neovim/nvim-lspconfig', 'nvim-lua/lsp-status.nvim'},
        config = function() require 'sv.configs.lsp.lspinstaller' end
    }
    use "b0o/schemastore.nvim"
    use {
        'mhartington/formatter.nvim', -- Helper for fast formatting
        config = function() require 'sv.configs.formatter' end
    }
    use {
        -- glepnir/lspsaga.nvim
        -- till glepnir goes back online
        'tami5/lspsaga.nvim',
        branch = 'nvim6.0',
        config = function()
            require('lspsaga').init_lsp_saga {
                -- NOTE: This is disabled because it doesn't check if
                -- the lsp server supports it before enabling the
                -- autocommand (It was the vscode like lightbulb)
                code_action_prompt = {enable = false}
            }
        end
    }

    -- TODO: Maybe make some of these opt and include them in the cmp config
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'neovim/nvim-lspconfig', 'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-path', 'onsails/lspkind-nvim', 'hrsh7th/cmp-cmdline',
            'octaltree/cmp-look',
            {'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim'}
        },
        config = function() require 'sv.configs.lsp.cmp' end
    }

    -- Telescope/Fuzzy finding
    use {
        'nvim-telescope/telescope.nvim',
        'cwebster2/github-coauthors.nvim',
        'nvim-telescope/telescope-project.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
        config = function() require 'sv.configs.telescope' end,
        requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'}
    }
    use {
        'windwp/nvim-spectre',
        config = function()
            vim.keymap.set('n', '<leader>as', require('spectre').open)
        end
    }

    -- Trouble
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('trouble').setup {}
            vim.keymap.set('n', '<leader>tt', '<cmd>TroubleToggle<CR>',
                           {silent = true, noremap = true})
        end
    }

    -- Snippets
    use {
        'hrsh7th/vim-vsnip',
        requires = {{'rafamadriz/friendly-snippets'}},
        config = function() require('sv.configs.vsnip') end
    }

    -- Treesitter and syntax
    use 'hashivim/vim-terraform'
    use {
        'nvim-treesitter/nvim-treesitter', -- Tree sitter
        'p00f/nvim-ts-rainbow', -- Rainbow brackets
        'nvim-treesitter/nvim-treesitter-textobjects', -- More objects I.E. functions, classes etc...
        'JoosepAlviste/nvim-ts-context-commentstring', -- Better comments in react
        run = ':TSUpdate',
        config = function() require 'sv.configs.nvim-treesitter' end
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'rhysd/committia.vim' -- Better commits
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('sv.configs.gitsigns') end
    }

    -- Fixes
    use 'romainl/vim-qf' -- Fixes issues with built in quick fix menu
    use 'tpope/vim-repeat' -- Repeat with . sequences that use pluggins
    use 'pgdouyon/vim-evanesco' -- Clears search highlighting on move

    -- Must have plugins
    use {
        'unblevable/quick-scope',
        config = function() require('sv.configs.quickscope') end
    }
    use 'tpope/vim-surround' -- Change/Add surrounding character
    use 'tpope/vim-sleuth' -- Automatically detect indentation
    use {
        'numToStr/Comment.nvim',
        config = function() require('sv.configs.comment') end
    }
    use 'AndrewRadev/tagalong.vim'

    -- TMUX
    use {
        'christoomey/vim-tmux-navigator', -- Unifies tmux and vim navigation
        'roxma/vim-tmux-clipboard', -- Unifies vim panes in tmux sessions clipboards
        'tmux-plugins/vim-tmux-focus-events' -- Required for vim-tmux-clipboard
    }

    -- Note taking
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        config = function() require('sv.configs.markdown-preview') end
    }

    -- UI
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require 'sv.configs.nvimtree' end
    }
    use {
        'rebelot/heirline.nvim', -- Status line
        requires = {
            'nvim-lua/lsp-status.nvim', -- For git information
            'kyazdani42/nvim-web-devicons'
        },
        config = function() require 'sv.configs.heirline' end
    }
    use({'catppuccin/nvim', as = 'catppuccin'}) -- Theme
end)

-- Other plugins that might be useful in future
-- 'miyakogi/seiya.vim', -- Transparency automagically
-- 'folke/tokyonight.nvim' -- Theme
-- 'rebelot/kanagawa.nvim' -- Theme
-- 'zoubin/vim-gotofile' -- Better go to file if you don't always have lsp running in node
-- 'rafcamlet/nvim-luapad' -- Lua scratchpad
