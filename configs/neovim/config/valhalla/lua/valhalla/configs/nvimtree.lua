local M = {}
M.setup = function()
    require("nvim-tree").setup {
        -- disables netrw completely
        disable_netrw = true,
        -- hijack netrw window on startup
        hijack_netrw = true,
        -- open the tree when running this setup function
        open_on_setup = false,
        -- will not open on setup if the filetype is in this list
        ignore_ft_on_setup = {},
        -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
        open_on_tab = true,
        actions = {
            open_file = {
                quit_on_open = false,
                window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = {
                            "notify",
                            "packer",
                            "qf",
                            "diff",
                            "fugitive",
                            "fugitiveblame",
                        },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            },
        },
        renderer = {
            add_trailing = true,
            group_empty = true,
            indent_markers = { enable = false },
            icons = {
                padding = " ", -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
                webdev_colors = true,
            },
            highlight_opened_files = "all",
        },
        -- hijack the cursor in the tree to put it at the start of the filename
        hijack_cursor = true,
        -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
        update_cwd = false,
        --[[ -- show lsp diagnostics in the signcolumn
    lsp_diagnostics = true, ]]
        -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
        update_focused_file = {
            -- enables the feature
            enable = true,
            -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
            -- only relevant when `update_focused_file.enable` is true
            update_cwd = false,
            -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
            -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
            ignore_list = {},
        },
        view = {
            side = "right",
            width = 34,
            height = 30,
            preserve_window_proportions = true,
            adaptive_size = true,
        },
    }

    vim.cmd "nnoremap <C-n> :NvimTreeToggle<CR>"
    vim.cmd "nnoremap <leader>f :NvimTreeToggle<CR>"

    vim.api.nvim_create_autocmd("BufEnter", {
        command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
        nested = true,
    })
end
return M
