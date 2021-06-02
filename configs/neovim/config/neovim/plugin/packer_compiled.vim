" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.dashboard\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.formatter\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26sv.configs.galaxyline\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n’\5\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0@&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\n\18n <leader>ghp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\18n <leader>ghu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\18n <leader>ghR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\tx ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\18n <leader>ghr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\vbuffer\2\18n <leader>ghs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\to ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\17n <leader>gb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 sv.configs.markdown-preview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  nerdtree = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24sv.configs.nerdtree\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin"
  },
  ["nerdtree-visual-selection"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nerdtree-visual-selection"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.lsp.compe\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lsp"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-lsp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30sv.configs.lsp.lspinstall\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31sv.configs.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-workbench"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30sv.configs.nvim-workbench\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-workbench"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26sv.configs.quickscope\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["seiya.vim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21sv.configs.seiya\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/seiya.vim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.telescope\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-evanesco"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-evanesco"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gotofile"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-gotofile"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-graphql"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-prisma"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-prisma"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-qf"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-clipboard"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-tmux-clipboard"
  },
  ["vim-tmux-focus-events"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-tmux-focus-events"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21sv.configs.vsnip\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: nvim-lspinstall
time("Config for nvim-lspinstall", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30sv.configs.lsp.lspinstall\frequire\0", "config", "nvim-lspinstall")
time("Config for nvim-lspinstall", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n’\5\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0@&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\n\18n <leader>ghp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\18n <leader>ghu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\18n <leader>ghR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\tx ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\18n <leader>ghr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\vbuffer\2\18n <leader>ghs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\to ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\17n <leader>gb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: quick-scope
time("Config for quick-scope", true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26sv.configs.quickscope\frequire\0", "config", "quick-scope")
time("Config for quick-scope", false)
-- Config for: formatter.nvim
time("Config for formatter.nvim", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.formatter\frequire\0", "config", "formatter.nvim")
time("Config for formatter.nvim", false)
-- Config for: seiya.vim
time("Config for seiya.vim", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21sv.configs.seiya\frequire\0", "config", "seiya.vim")
time("Config for seiya.vim", false)
-- Config for: nvim-workbench
time("Config for nvim-workbench", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30sv.configs.nvim-workbench\frequire\0", "config", "nvim-workbench")
time("Config for nvim-workbench", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: trouble.nvim
time("Config for trouble.nvim", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time("Config for trouble.nvim", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26sv.configs.galaxyline\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.lsp.compe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: vim-vsnip
time("Config for vim-vsnip", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21sv.configs.vsnip\frequire\0", "config", "vim-vsnip")
time("Config for vim-vsnip", false)
-- Config for: dashboard-nvim
time("Config for dashboard-nvim", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.dashboard\frequire\0", "config", "dashboard-nvim")
time("Config for dashboard-nvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31sv.configs.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: nerdtree
time("Config for nerdtree", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24sv.configs.nerdtree\frequire\0", "config", "nerdtree")
time("Config for nerdtree", false)
-- Config for: zen-mode.nvim
time("Config for zen-mode.nvim", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time("Config for zen-mode.nvim", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
