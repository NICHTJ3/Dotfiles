local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')
local builtin = require('telescope.builtin')
local telescope = require('telescope')

local M = {}

M.Setup = function()
    vim.cmd('packadd! github-coauthors.nvim')
    vim.cmd('packadd! telescope-project.nvim')
    vim.cmd('packadd! telescope-ui-select.nvim')
    vim.cmd('packadd! telescope-fzf-native.nvim')

    telescope.setup {
        defaults = {
            prompt_prefix = ' >',
            color_devicons = true,

            file_previewer = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer = require('telescope.previewers').vim_buffer_vimgrep
                .new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist
                .new,

            mappings = {
                i = {
                    ["<Esc>"] = actions.close,
                    ["<C-x>"] = false,
                    ["<C-q>"] = actions.send_to_qflist,
                    ["<C-t>"] = trouble.open_with_trouble
                }
            }
        },
        extensions = {
            fzf = {
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true -- override the file sorter
            },
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                    -- even more opts
                }
            }
        }
    }

    telescope.load_extension('fzf')
    telescope.load_extension('project')
    telescope.load_extension('githubcoauthors')
    telescope.load_extension("ui-select")
end

M.ListNeovim = function()
    builtin.find_files {
        prompt_title = "< Neovim Config >",
        cwd = "~/Dotfiles/configs/neovim/config/neovim"
    }
end

M.ListFiles = function() builtin.find_files() end

M.ListProjects = function() telescope.extensions.project.project {} end

M.Mappings = function()
    -- Open Telescope Files
    vim.keymap.set('n', '<leader>lf',
                   "<cmd>lua require('sv.configs.telescope').ListFiles()<CR>")
    vim.keymap.set('n', '<c-p>',
                   "<cmd>lua require'sv.configs.telescope'.ListFiles()<CR>")
    -- Edit nvim config
    vim.keymap.set('n', '<leader>ev',
                   "<cmd>lua require('sv.configs.telescope').ListNeovim()<CR>")
    -- Open Telescope buffers
    vim.keymap.set('n', '<leader>lb',
                   "<cmd>lua require('telescope.builtin').buffers()<CR>")
    -- Open live grep search
    vim.keymap.set('n', '<leader>/',
                   "<cmd>lua require('telescope.builtin').live_grep()<CR>")
    -- Search current work
    vim.keymap.set('n', '<leader>sw',
                   "<cmd>lua require('telescope.builtin').grep_string()<CR>")

    -- Github-coauthors
    vim.keymap.set('n', '<leader>lca',
                   "<cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>")
    -- List projects
    vim.keymap.set('n', '<leader>lp',
                   "<cmd>lua require'sv.configs.telescope'.ListProjects()<CR")


end

return M
