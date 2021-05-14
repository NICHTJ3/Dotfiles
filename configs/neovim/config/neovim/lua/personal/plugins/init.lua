local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd
local g = vim.g

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- NOTE: Install packer if it hasn't already been installed
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

-- Only required if you have packer configured as `opt`
cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- COC Autocomplete and Linting
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Telescope/Fuzzy finding
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config=function ()
            require'personal.plugins.telescope'
        end
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Snippets and Syntax
    g['polyglot_disabled']={'coffee-script'}
    use 'sheerun/vim-polyglot'
    use 'honza/vim-snippets'
    use 'pantharshit00/vim-prisma'
    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',config=function ()
        require'personal.plugins.nvim-treesitter'
    end }
    use 'p00f/nvim-ts-rainbow'


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
    use {'folke/todo-comments.nvim',config=function ()
        require'personal.plugins.todo-comments'
    end}
    use 'unblevable/quick-scope'
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
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

    -- UI
    use 'mhinz/vim-startify'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config=function ()
            require'personal.plugins.lua-line'
        end
    }
    use 'folke/tokyonight.nvim'
    use 'miyakogi/seiya.vim' -- Transparency automagically

end)

