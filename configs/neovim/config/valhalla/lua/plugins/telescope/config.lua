local actions = require "telescope.actions"
local layout_actions = require "telescope.actions.layout"
local files = require "plugins.telescope.helpers.find_files"
local git = require "plugins.telescope.helpers.git"
local builtin = require "telescope.builtin"

local M = {}

M.keymaps = function()
    vim.keymap.set("n", "<leader>lf", files.find)
    vim.keymap.set("n", "<c-p>", files.find)
    -- Edit nvim config
    vim.keymap.set("n", "<leader>ev", function()
        builtin.find_files {
            prompt_title = "< Neovim Config >",
            cwd = "~/Dotfiles/configs/neovim/config/valhalla",
        }
    end)
    vim.keymap.set("n", "<leader>gs", git.status)
    vim.keymap.set("n", "<leader>/", files.grep)
    vim.keymap.set("n", "<leader>ga", require("telescope").extensions.githubcoauthors.coauthors)
end

M.setup = function()
    local is_win = vim.fn.has "win32" == 1

    local has_fzf = pcall(require, "telescope._extensions.fzf")
    if not is_win and has_fzf then
        require("telescope").load_extension "fzf"
    end

    if pcall(require, "telescope._extensions.githubcoauthors") then
        require("telescope").load_extension "githubcoauthors"
    end

    require("telescope").setup {
        defaults = {
            file_sorter = require("telescope.sorters").get_fzy_sorter,
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            prompt_prefix = " <?> ",
            selection_caret = "  ",
            selection_strategy = "reset",
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },
            sorting_strategy = "descending",
            layout_strategy = "flex",
            layout_config = {
                flex = {
                    flip_columns = 161, -- half 27" monitor, scientifically calculated
                },
                horizontal = {
                    preview_cutoff = 0,
                    preview_width = 0.6,
                },
                vertical = {
                    preview_cutoff = 0,
                    preview_height = 0.65,
                },
            },
            path_display = { truncate = 3 },
            color_devicons = true,
            winblend = 5,
            set_env = { ["COLORTERM"] = "truecolor" },
            border = {},
            borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
            mappings = {
                i = {
                    ["<C-w>"] = function()
                        vim.api.nvim_input "<c-s-w>"
                    end,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-l>"] = layout_actions.toggle_preview,
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    ["<Esc>"] = actions.close,
                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
                },
            },
        },
        extensions = {
            project = {
                hidden_files = false,
            },
            fzf = (is_win and not has_fzf) and {} or {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    }
end

return M
