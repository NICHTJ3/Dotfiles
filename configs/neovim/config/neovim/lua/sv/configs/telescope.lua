local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')
local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup {
    defaults = {
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

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

local M = {}

M.ListNeovim = function()
    builtin.find_files {
        prompt_title = "< Neovim Config >",
        cwd = "~/Dotfiles/configs/neovim/config/neovim"
    }
end

M.ListFiles = function() builtin.find_files() end

M.ListProjects = function() telescope.extensions.project.project {} end

return M
