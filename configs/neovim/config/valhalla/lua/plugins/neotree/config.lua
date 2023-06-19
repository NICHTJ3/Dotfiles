local M = {}
local popup = require "neo-tree.ui.popups"

if pcall(require, "neo-tree") then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrwSettings = 1
    vim.g.loaded_netrwFileHandlers = 1
end

M.setup = function()
    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
    -- NOTE: this is changed from v1.x, which used the old style of highlight groups
    -- in the form "LspDiagnosticsSignWarning"

    require("neo-tree").setup {
        source_selector = {
            winbar = true,
            statusline = false
        },
        sources = {
            "filesystem",
            "buffers",
            "diagnostics",
            "git_status",
            -- ...and any additional source
        },
        diagnostics = {
            bind_to_cwd = true,
            diag_sort_function = "severity", -- "severity" means diagnostic items are sorted by severity in addition to their positions.
            -- "position" means diagnostic items are sorted strictly by their positions.
            -- May also be a function.
            follow_behavior = { -- Behavior when `follow_current_file` is true
                always_focus_file = false, -- Focus the followed file, even when focus is currently on a diagnostic item belonging to that file.
                expand_followed = true, -- Ensure the node of the followed file is expanded
                collapse_others = true, -- Ensure other nodes are collapsed
            },
            follow_current_file = true,
            group_dirs_and_files = true, -- when true, empty folders and files will be grouped together
            group_empty_dirs = true, -- when true, empty directories will be grouped together
            show_unloaded = true, -- show diagnostics from unloaded buffers
        },
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        sort_case_insensitive = true, -- used when sorting files and directories in the tree
        sort_function = nil, -- use a custom function for sorting files and directories in the tree
        default_component_configs = {
            container = {
                enable_character_fade = true,
            },
            indent = {
                indent_size = 2,
                padding = 1, -- extra padding on left hand side
                -- indent guides
                with_markers = true,
                indent_marker = "│",
                last_indent_marker = "└",
                highlight = "NeoTreeIndentMarker",
                -- expander config, needed for nesting files
                with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "ﰊ",
                -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                -- then these will never be used.
                default = "*",
                highlight = "NeoTreeFileIcon",
            },
            modified = {
                symbol = "[+]",
                highlight = "NeoTreeModified",
            },
            name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
            },
            git_status = {
                symbols = {
                    -- Change type
                    added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted = "✖", -- this can only be used in the git_status source
                    renamed = "", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored = "",
                    unstaged = "",
                    staged = "",
                    conflict = "",
                },
            },
        },
        window = {
            position = "right",
            width = 45,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            mappings = {
                ["<space>"] = {
                    "toggle_node",
                    nowait = true, -- disable `nowait` if you have existing combos starting with this char that you want to use
                },
                ["<2-LeftMouse>"] = "open",
                ["<cr>"] = "open",
                ["S"] = "open_split",
                ["s"] = "open_vsplit",
                ["t"] = "open_tabnew",
                ["w"] = "open_with_window_picker",
                ["C"] = "close_node",
                ["z"] = "",
                ["a"] = {
                    "add",
                    -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                    config = {
                        show_path = "none", -- "none", "relative", "absolute"
                    },
                },
                ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
                ["d"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["x"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                ["q"] = "close_window",
                ["R"] = "refresh",
                ["?"] = "show_help",
                ["<"] = "prev_source",
                [">"] = "next_source",
            },
        },
        nesting_rules = {},
        filesystem = {
            commands = {
                preview_file_name = function(state)
                    local node = state.tree:get_node()
                    popup.alert("File name", node.name)
                end,
            },
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = true,
                hide_gitignored = true,
                hide_hidden = true, -- only works on Windows for hidden files/directories
                always_show = { -- remains visible even if other settings would normally hide it
                    ".teamcity",
                    ".gitignore",
                    ".dockerignore",
                    ".eslint*",
                    ".nvmrc",
                    ".npmrc",
                },
            },
            follow_current_file = true, -- This will find and focus the file in the active buffer every
            -- time the current file is changed while the tree is open.
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.
            window = {
                mappings = {
                    ["K"] = "preview_file_name",
                    ["<bs>"] = "navigate_up",
                    ["."] = "set_root",
                    ["I"] = "toggle_hidden",
                    ["/"] = "",
                    ["D"] = "",
                    ["f"] = "filter_on_submit",
                    ["F"] = "clear_filter",
                    ["[c"] = "prev_git_modified",
                    ["]c"] = "next_git_modified",
                },
            },
        },
        buffers = {
            follow_current_file = true, -- This will find and focus the file in the active buffer every
            -- time the current file is changed while the tree is open.
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            show_unloaded = true,
            window = {
                mappings = {
                    ["bd"] = "buffer_delete",
                    ["<bs>"] = "navigate_up",
                    ["."] = "set_root",
                },
            },
        },
        git_status = {
            window = {
                mappings = {
                    ["A"] = "git_add_all",
                    ["gu"] = "git_unstage_file",
                    ["ga"] = "git_add_file",
                    ["gr"] = "git_revert_file",
                    ["gc"] = "git_commit",
                    ["gp"] = "git_push",
                    ["gg"] = "git_commit_and_push",
                },
            },
        },
    }
end

M.keymaps = function()
    vim.keymap.set("n", "\\", "<CMD>Neotree toggle<cr>")
    vim.keymap.set("n", "<c-n>", "<CMD>Neotree toggle<cr>")
    vim.keymap.set("n", "<leader>sf", "<CMD>Neotree toggle<cr>")
    vim.keymap.set("n", "<leader>sd", "<CMD>Neotree toggle diagnostics<cr>")
    vim.keymap.set("n", "<leader>sg", "<CMD>Neotree toggle git_status<cr>")
end

return M
