local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

return require('packer').startup(function(use)
    -- -------
    -- Packer can manage itself
    -- -------
    use 'wbthomason/packer.nvim'

    -- -------
    -- LSP
    -- -------
    use 'neovim/nvim-lspconfig'
    use {
        'williamboman/nvim-lsp-installer',
        requires = {'neovim/nvim-lspconfig'},
        config = function() require 'valhalla.lsp.lspinstaller' end
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup {} end
    }

    -- FIXME: What does this require
    use {'glepnir/lspsaga.nvim'}

    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require'lsp_signature'.on_attach(
                {
                    fix_pos = true, -- set to true, the floating window will not auto-close until finish all parameters
                    use_lspsaga = true -- set to true if you want to use lspsaga popup
                })
        end,
        requires = 'glepnir/lspsaga.nvim'
    }

    -- -------
    -- Syntax
    -- -------
    use 'pantharshit00/vim-prisma'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            {'p00f/nvim-ts-rainbow'},
            {'nvim-treesitter/nvim-treesitter-textobjects'}
        },
        config = function() require 'valhalla.nvim-treesitter' end
    }

    -- -------
    -- Git
    -- -------
    use 'tpope/vim-fugitive'
    use 'rhysd/committia.vim' -- Better commits
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('valhalla.gitsigns') end
    }

    -- -------
    -- Musthave plugins
    -- -------
    use 'tpope/vim-surround' -- Change/Add surrounding character
    use 'tpope/vim-repeat' -- Repeat with . sequences that use pluggins
    use 'romainl/vim-qf' -- Fixes issues with built in quick fix menu
    use 'zoubin/vim-gotofile' -- Better go to file for node projects
    use 'pgdouyon/vim-evanesco' -- Clears search highlighting on move
    use 'tpope/vim-sleuth' -- Automatically detect indentation NOTE: This is not realy working
    use {
        'unblevable/quick-scope',
        config = function() require('valhalla.quickscope') end
    }

    -- --------
    -- Commenting
    -- --------
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
        end,
        requires = {
            {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
            'JoosepAlviste/nvim-ts-context-commentstring'
        }

    }

    -- -------
    -- Formatting
    -- -------
    use {
        'mhartington/formatter.nvim',

        config = function() require 'valhalla.formatter' end
    }

    -- -------
    -- Completion
    -- -------
    use {
        'hrsh7th/nvim-cmp',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-path',
        'onsails/lspkind-nvim',
        'hrsh7th/cmp-cmdline',
        'octaltree/cmp-look',
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        config = function() require 'valhalla.lsp.cmp' end
    }

    -- -------
    -- Snippets
    -- -------
    use {
        'hrsh7th/vim-vsnip',
        requires = {{'rafamadriz/friendly-snippets'}},
        config = function()
            -- Share javascript and typescript snippets with react file types
            vim.g.vsnip_filetypes = {
                javascriptreact = {'javascript'},
                typescriptreact = {'typescript'}
            }
        end
    }

    -- -------
    -- UI
    -- -------

    -- Sidebar
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require 'valhalla.nvimtree' end
    }

    -- Better status bar
    use {
        'glepnir/galaxyline.nvim', -- Status line
        branch = 'main',
        config = function() require 'valhalla.galaxyline' end,
        requires = {
            {'kyazdani42/nvim-web-devicons', opt = true},
            {'nvim-lua/lsp-status.nvim'} -- For git information
        }
    }
    -- TabBar
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("bufferline").setup {
                options = {
                    custom_filter = function(buf_number)
                        -- filter out by buffer name
                        if vim.fn.bufname(buf_number) ~= "Right" and
                            vim.fn.bufname(buf_number) ~= "Left" and
                            vim.fn.bufname(buf_number) ~= "Below" and
                            vim.fn.bufname(buf_number) ~= "Above" then
                            return true
                        end
                    end,
                    always_show_bufferline = true,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            text_align = "left"
                        }
                    }
                }
            }
        end
    }

    -- Colorschemes
    use 'folke/tokyonight.nvim' -- Theme
    use 'tiagovla/tokyodark.nvim' -- Theme

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then require('packer').sync() end
end)
