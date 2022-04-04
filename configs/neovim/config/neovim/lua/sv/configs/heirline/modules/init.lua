local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local clrs = require("catppuccin.core.color_palette")

-- settings
local sett = {
    bkg = clrs.black3,
    branch = clrs.sky,
    bright_bg = clrs.bright_bg,
    curr_dir = clrs.flamingo,
    curr_file = clrs.white,
    diffs = clrs.peach,
    extras = clrs.gray1,
    inactive_bkg = clrs.gray0,
    scroll_bar = clrs.sky,
    diag = {
        warn = utils.get_highlight("DiagnosticWarn").fg,
        error = utils.get_highlight("DiagnosticError").fg,
        hint = utils.get_highlight("DiagnosticHint").fg,
        info = utils.get_highlight("DiagnosticInfo").fg
    },
    git = {del = clrs.red, add = clrs.green, change = clrs.orange}
}

local Space = {provider = " "}

local ViMode = {
    -- get vim current mode, this information will be required by the provider
    -- and the highlight functions, so we compute it only once per component
    -- evaluation and store it as a component attribute
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
    end,
    -- Now we define some dictionaries to map the output of mode() to the
    -- corresponding string and color. We can put these into `static` to compute
    -- them at initialisation time.
    static = {
        mode_names = { -- change the strings if yow like it vvvvverbose!
            n = "N",
            no = "N?",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "V",
            vs = "Vs",
            V = "V_",
            Vs = "Vs",
            ["\22"] = "^V",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I",
            ic = "Ic",
            ix = "Ix",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T"
        },
        mode_colors = {
            n = clrs.lavender,
            i = clrs.green,
            v = clrs.flamingo,
            V = clrs.flamingo,
            ["\22"] = clrs.flaminfo, -- this is an actual ^V, type <C-v><C-v> in insert mode
            c = clrs.peach,
            s = clrs.maroon,
            S = clrs.maroon,
            ["\19"] = clrs.maroon, -- this is an actual ^S, type <C-v><C-s> in insert mode
            R = clrs.teal,
            r = clrs.teal,
            ["!"] = clrs.green,
            t = clrs.green
        }
    },
    -- We can now access the value of mode() that, by now, would have been
    -- computed by `init()` and use it to index our strings dictionary.
    -- note how `static` fields become just regular attributes once the
    -- component is instantiated.
    -- To be extra meticulous, we can also add some vim statusline syntax to
    -- control the padding and make sure our string is always at least 2
    -- characters long
    provider = function(self)
        return " %2(" .. self.mode_names[self.mode] .. "%)"
    end,
    -- Same goes for the highlight. Now the foreground will change according to the current mode.
    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return {fg = self.mode_colors[mode], style = "bold"}
    end
}

local FileNameBlock = {
    -- let's first set up some attributes needed by this component and it's children
    init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end
}
-- We can now define some children separately and add them later

local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension,
                                                        {default = true})
    end,
    provider = function(self) return self.icon and (self.icon .. " ") end,
    hl = function(self) return {fg = self.icon_color} end
}

local function split(str, sep)
    local res = {}
    local n = 1
    for w in str:gmatch('([^' .. sep .. ']*)') do
        res[n] = res[n] or w -- only set once (so the blank after a string is ignored)
        if w == '' then n = n + 1 end -- step forwards on a blank but not a string
    end
    return res
end

local FilePath = {
    init = function(self)
        self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
        if self.lfilename == "" then self.lfilename = "[No Name]" end
    end,
    hl = {fg = sett.curr_dir},

    provider = function()
        local fp = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
        local tbl = split(fp, '/')
        local len = #tbl

        if len > 2 and not len == 3 and not tbl[0] == '~' then
            -- return '…/' .. table.concat(tbl, '/', len - 1) .. '/' -- shorten filepath to last 2 folders
            -- alternative: only last folder in filepath
            return '…/' .. tbl[len] .. '/'
            -- alternative: only 1 containing folder using vim builtin function
            -- return '…/' .. vim.fn.fnamemodify(vim.fn.expand '%', ':p:h:t') .. '/'
        else
            return fp .. '/'
        end
    end
}

local FileFlags = {
    {
        provider = function() if vim.bo.modified then return "" end end,

        hl = {fg = clrs.green}
    }, {
        provider = function()
            if not vim.bo.modifiable or vim.bo.readonly then
                return ""
            end
        end,
        hl = {fg = clrs.orange}
    }
}

local FileName = {
    provider = function()
        local file = vim.fn.expand '%:t'
        if vim.fn.empty(file) == 1 then return '' end
        return file .. ' '
    end,
    hl = {fg = sett.curr_file, style = "bold"}
}

local FileNameModifer = {
    hl = function()
        if vim.bo.modified then
            -- use `force` because we need to override the child's hl foreground
            return {fg = sett.diffs, style = "bold", force = true}
        end
    end
}

-- let's add the children to our FileNameBlock component
FileNameBlock =
    utils.insert(FileNameBlock, FileIcon, FilePath, -- A small optimisation, since their parent does nothing
                 utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
                 unpack(FileFlags) -- A small optimisation, since their parent does nothing
    )

local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%7(%l/%3L%):%2c %P"
}

local ScrollPercentage = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%P",
    hl = {fg = sett.extras}
}

local ScrollBar = {
    static = {sbar = {"▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"}},
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor(curr_line / lines * (#self.sbar - 1)) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = {fg = sett.scroll_bar, bg = sett.bright_bg}
}

local LSPActive = utils.make_flexible_component(2, {
    condition = conditions.lsp_attached,

    -- You can keep it simple,
    -- provider = " [LSP]",

    -- Or complicate things a bit and get the servers names
    provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.buf_get_clients(0)) do
            table.insert(names, server.name)
        end
        return " [" .. table.concat(names, ", ") .. "]"
    end,
    hl = {fg = sett.extras, style = "bold"}
}, {
    condition = conditions.lsp_attached,

    provider = " [LSP]",

    hl = {fg = sett.extras, style = "bold"}
})

local LSPMessages = {
    provider = function()
        -- Enable once https://github.com/nvim-lua/lsp-status.nvim/issues/60 is fixed
        return ""
        -- if #vim.lsp.buf_get_clients() > 0 then
        --     return require("lsp-status").status()
        -- end
    end,
    hl = {fg = sett.extras}
}

local function get_sign(sign)
    return (vim.fn.sign_getdefined(sign)[1] or {text = ""}).text
end

local Diagnostics = {

    condition = conditions.has_diagnostics,

    static = {
        error_icon = get_sign("DiagnosticSignError"),
        warn_icon = get_sign("DiagnosticSignWarn"),
        info_icon = get_sign("DiagnosticSignInfo"),
        hint_icon = get_sign("DiagnosticSignHint")
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, {
            severity = vim.diagnostic.severity.ERROR
        })
        self.warnings = #vim.diagnostic.get(0, {
            severity = vim.diagnostic.severity.WARN
        })
        self.hints = #vim.diagnostic.get(0, {
            severity = vim.diagnostic.severity.HINT
        })
        self.info = #vim.diagnostic.get(0, {
            severity = vim.diagnostic.severity.INFO
        })
    end,

    {
        provider = function(self)
            if self.errors == 0 then return "" end
            local result = (self.error_icon .. self.errors)
            if self.warnings > 0 or self.hints > 0 or self.info > 0 then
                result = result .. " "
            end
            return result
        end,
        hl = {fg = sett.diag.error}
    },
    {
        provider = function(self)
            if self.warnings == 0 then return "" end
            local result = (self.warn_icon .. self.warnings)
            if self.hints > 0 or self.info > 0 then
                result = result .. " "
            end
            return result
        end,
        hl = {fg = sett.diag.warn}
    },
    {
        provider = function(self)
            if self.info == 0 then return "" end
            local result = (self.info_icon .. self.info)
            if self.hints > 0 then result = result .. " " end
            return result
        end,
        hl = {fg = sett.diag.info}
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = {fg = sett.diag.hint}
    }
}

local GitBranch = {
    provider = function()
        return (vim.b.gitsigns_head or vim.g.gitsigns_head) and ' ' ..
                   (vim.b.gitsigns_head or vim.g.gitsigns_head)
    end,
    condition = vim.b.gitsigns_head or vim.g.gitsigns_head,
    hl = {fg = sett.branch}
}

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or
                               self.status_dict.removed ~= 0 or
                               self.status_dict.changed ~= 0
    end,

    hl = {fg = sett.diffs},

    Space,
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = {fg = sett.git.add}
    },
    Space,
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = {fg = sett.git.del}
    },
    Space,
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = {fg = sett.git.change}
    }
}

local WorkDir = {
    provider = function(self)
        self.icon = (vim.fn.haslocaldir(0) == 1 and "" or "") .. "" .. " "
        local cwd = vim.fn.getcwd(0)
        self.cwd = vim.fn.fnamemodify(cwd, ":~")
    end,
    hl = {fg = sett.curr_dir, style = "bold"},

    utils.make_flexible_component(1, {
        provider = function(self)
            local trail = self.cwd:sub(-1) == "/" and "" or "/"
            return self.icon .. self.cwd .. trail .. " "
        end
    }, {
        provider = function(self)
            local cwd = vim.fn.pathshorten(self.cwd)
            local trail = self.cwd:sub(-1) == "/" and "" or "/"
            return self.icon .. cwd .. trail .. " "
        end
    }, {provider = ""})
}

local HelpFilename = {
    condition = function() return vim.bo.filetype == "help" end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
    end,
    hl = {fg = sett.curr_file}
}

local TerminalName = {
    -- condition = function()
    --     return vim.bo.bufype == 'terminal'
    -- end,
    -- icon = ' ', -- 
    provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return " " .. tname
    end,
    hl = {fg = sett.curr_dir, style = "bold"}
}

local Spell = {
    condition = function() return vim.wo.spell end,
    provider = "SPELL ",
    hl = {style = "bold", fg = sett.diffs}
}

local Align = {provider = "%="}

return {
    Align = Align,
    Diagnostics = Diagnostics,
    FileNameBlock = FileNameBlock,
    Git = Git,
    GitBranch = GitBranch,
    HelpFilename = HelpFilename,
    LSPActive = LSPActive,
    LSPMessages = LSPMessages,
    Ruler = Ruler,
    ScrollBar = ScrollBar,
    Space = Space,
    Spell = Spell,
    TerminalName = TerminalName,
    ViMode = ViMode,
    WorkDir = WorkDir,
    sett = sett,
    colors = clrs,
    ScrollPercentage = ScrollPercentage
}
