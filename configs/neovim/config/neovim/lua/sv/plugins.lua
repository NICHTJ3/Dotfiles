return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use {
        'neovim/nvim-lspconfig', {
            'williamboman/nvim-lsp-installer',
            requires = {{'neovim/nvim-lspconfig'}, {"b0o/schemastore.nvim"}},
            config = function() require 'sv.configs.lsp.lspinstaller' end
        }, {
            -- glepnir/lspsaga.nvim
            -- till glepnir goes back online
            'tami5/lspsaga.nvim',
            branch = 'nvim6.0',
            config = function()
                require('lspsaga').init_lsp_saga {
                    -- NOTE: This is dissabled because it doesn't check if
                    -- the lsp server supports it before enabling the
                    -- autocommand (It was the vscode like lightbulb)
                    code_action_prompt = {enable = false}
                }
            end
        }, {
            'mhartington/formatter.nvim', -- Helper for fast formatting
            config = function() require 'sv.configs.formatter' end
        }
    }

    -- TODO: Maybe make some of these opt and include them in the cmp config
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'neovim/nvim-lspconfig', 'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-path', 'onsails/lspkind-nvim', 'hrsh7th/cmp-cmdline',
            'octaltree/cmp-look', 'hrsh7th/cmp-nvim-lsp-document-symbol',
            {'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim'}
        },
        config = function() require 'sv.configs.lsp.cmp' end
    }

    -- Telescope/Fuzzy finding
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require 'sv.configs.telescope' end,
        requires = {
            'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim',
            'cwebster2/github-coauthors.nvim',
            'nvim-telescope/telescope-project.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
            {
                'nvim-telescope/telescope-frecency.nvim',
                requires = {'tami5/sqlite.lua'}
            }
        }
    }
    use {
        'windwp/nvim-spectre',
        config = function() require('sv.configs.spectre') end
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

    -- Snippets and Syntax
    use {
        'hrsh7th/vim-vsnip',
        requires = {{'rafamadriz/friendly-snippets'}},
        config = function() require('sv.configs.vsnip') end
    }
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
    use {
        'tveskag/nvim-blame-line', -- Git blame in virtual_text
        config = function()
            vim.g.blameLineVirtualTextHighlight = 'Question'
            vim.keymap.set('n', '<leader>tgb', '<cmd>ToggleBlameLine<CR>',
                           {noremap = true})
        end
    }
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
    use 'zoubin/vim-gotofile' -- Better go to file
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
        config = function()
            require('Comment').setup {
                pre_hook = function(ctx)
                    -- Only calculate commentstring for tsx filetypes
                    if vim.bo.filetype == 'typescriptreact' then
                        local U = require('Comment.utils')

                        -- Detemine whether to use linewise or blockwise commentstring
                        local type =
                            ctx.ctype == U.ctype.line and '__default' or
                                '__multiline'

                        -- Determine the location where to calculate commentstring from
                        local location = nil
                        if ctx.ctype == U.ctype.block then
                            location =
                                require('ts_context_commentstring.utils').get_cursor_location()
                        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion ==
                            U.cmotion.V then
                            location =
                                require('ts_context_commentstring.utils').get_visual_start_location()
                        end

                        return
                            require('ts_context_commentstring.internal').calculate_commentstring(
                                {key = type, location = location})
                    end
                end

            }
        end
    }
    use 'AndrewRadev/tagalong.vim'

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
            require('bufferline').setup {
                options = {
                    custom_filter = function(buf_number)
                        -- filter out by buffer name
                        if vim.fn.bufname(buf_number) ~= 'Right' and
                            vim.fn.bufname(buf_number) ~= 'Left' and
                            vim.fn.bufname(buf_number) ~= 'Below' and
                            vim.fn.bufname(buf_number) ~= 'Above' then
                            return true
                        end
                    end,
                    always_show_bufferline = true,
                    offsets = {
                        {
                            filetype = 'NvimTree',
                            text = 'File Explorer',
                            highlight = 'Directory',
                            text_align = 'left'
                        }
                    }
                }
            }
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require 'sv.configs.nvimtree' end
    }
    use {
        -- 'glepnir/galaxyline.nvim', -- Status line
        -- till glepnir goes back online
        'NTBBloodbath/galaxyline.nvim',
        branch = 'main',
        config = function() require 'sv.configs.galaxyline' end,
        requires = {
            {'kyazdani42/nvim-web-devicons', opt = true},
            {'nvim-lua/lsp-status.nvim'} -- For git information
        }
    }
    use 'folke/tokyonight.nvim' -- Theme
    use "rebelot/kanagawa.nvim" -- Theme
    use({"catppuccin/nvim", as = "catppuccin"}) -- Theme
    use {
        'miyakogi/seiya.vim', -- Transparency automagically
        config = function()
            -- Automatically enable seiya
            vim.g.seiya_auto_enable = 1
            -- Doesn't work by default in neovim with true-color terminal the below fixes
            -- this
            vim.g.seiya_target_groups = {'guibg'}
        end
    }
end)
