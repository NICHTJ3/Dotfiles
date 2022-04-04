local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local Modules = require("sv.configs.heirline.modules.init")

local DefaultStatusline = {
    Modules.ViMode, Modules.Space, Modules.Spell, Modules.FileNameBlock,
    Modules.Space, Modules.GitBranch, Modules.Git, {provider = "%<"},
    Modules.Align, Modules.Align, Modules.LSPActive, Modules.LSPMessages,
    Modules.Space, Modules.Diagnostics, Modules.Space, Modules.Space,
    Modules.Space, Modules.Ruler, Modules.Space, Modules.ScrollBar
}

local InactiveStatusline = {
    condition = function() return not conditions.is_active() end,
    {hl = {fg = Modules.colors.gray, force = true}},
    Modules.FileNameBlock,
    {provider = "%<"},
    Modules.Align
}

local GitCommitStatusline = {
    condition = function()
        return conditions.buffer_matches({filetype = {"^git.*", "fugitive"}})
    end,
    Modules.ViMode,
    Modules.Space,
    Modules.GitBranch,
    Modules.Space,
    Modules.Align
}

local SpecialStatusline = {
    condition = function()
        return conditions.buffer_matches(
                   {buftype = {"nofile", "prompt", "help", "quickfix"}})
    end,
    Modules.Space,
    Modules.HelpFilename,
    Modules.Align
}

local TerminalStatusline = {
    condition = function()
        return conditions.buffer_matches({buftype = {"terminal"}})
    end,
    hl = {bg = Modules.colors.dark_red},
    {condition = conditions.is_active, Modules.ViMode, Modules.Space},
    Modules.Space,
    Modules.TerminalName,
    Modules.Align
}

local StatusLines = {

    hl = function()
        if conditions.is_active() then
            return {
                fg = utils.get_highlight("StatusLine").fg,
                bg = utils.get_highlight("StatusLine").bg
            }
        else
            return {
                fg = utils.get_highlight("StatusLineNC").fg,
                bg = utils.get_highlight("StatusLineNC").bg
            }
        end
    end,

    init = utils.pick_child_on_condition,

    TerminalStatusline,
    InactiveStatusline,
    GitCommitStatusline,
    SpecialStatusline,
    DefaultStatusline
}

require("heirline").setup(StatusLines)
