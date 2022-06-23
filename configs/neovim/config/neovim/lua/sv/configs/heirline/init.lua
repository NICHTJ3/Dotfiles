local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local Modules = require("sv.configs.heirline.modules.init")

local Space = Modules.Space
local Align = Modules.Align

local DefaultStatusline = {
    Modules.ViMode, Space, Modules.Spell, Modules.FileNameBlock, Space,
    Modules.GitBranch, Modules.Git, { provider = "%<" }, Align, Align,
    Modules.LSPActive, Modules.LSPMessages, Space, Modules.Diagnostics, Space,
    Space, Space, Modules.ScrollPercentage, Space, Modules.ScrollBar
}

local InactiveStatusline = {
    condition = function() return not conditions.is_active() end,
    { hl = { fg = Modules.sett.inactive_bkg, force = true } },
    Modules.FileNameBlock,
    { provider = "%<" },
    Align
}

local GitCommitStatusline = {
    condition = function()
        return conditions.buffer_matches({ filetype = { "^git.*", "fugitive" } })
    end,
    Modules.ViMode,
    Space,
    Modules.GitBranch,
    Space,
    Align
}

local SpecialStatusline = {
    condition = function()
        return conditions.buffer_matches(
            { buftype = { "nofile", "prompt", "help", "quickfix" } })
    end,
    Modules.ViMode,
    Space,
    Modules.HelpFilename,
    Space,
    Modules.GitBranch,
    Align
}

local TerminalStatusline = {
    condition = function()
        return conditions.buffer_matches({ buftype = { "terminal" } })
    end,
    hl = { bg = Modules.sett.curr_dir },
    { condition = conditions.is_active, Modules.ViMode, Space },
    Space,
    Modules.TerminalName,
    Align
}

local StatusLines = {
    hl = function()
        if conditions.is_active() then
            return {
                fg = utils.get_highlight("StatusLine").fg,
                bg = utils.get_highlight("StatusLine").bg
            }
        end
        return {
            fg = utils.get_highlight("StatusLineNC").fg,
            bg = utils.get_highlight("StatusLineNC").bg
        }
    end,

    init = utils.pick_child_on_condition,

    TerminalStatusline,
    InactiveStatusline,
    GitCommitStatusline,
    SpecialStatusline,
    DefaultStatusline
}

vim.o.laststatus = 3
require("heirline").setup(StatusLines)
