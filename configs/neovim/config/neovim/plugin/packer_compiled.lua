-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

time([[Luarocks path setup]], true)
local package_path_str = "/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/trent.nicholson/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\1\4\0\a\0\0316\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\6\1\3\0X\1\23�6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\6\1\4\0X\1\16�6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\6\1\5\0X\1\t�6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\6\1\6\0X\1\2�+\1\2\0L\1\2\0K\0\1\0\nAbove\nBelow\tLeft\nRight\fbufname\afn\bvim�\1\1\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0003\4\3\0=\4\5\0034\4\3\0005\5\6\0>\5\1\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\4\14highlight\14Directory\15text_align\tleft\ttext\18File Explorer\rfiletype\rNvimTree\18custom_filter\1\0\1\27always_show_bufferline\2\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-cmdline"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
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
  ["github-coauthors.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/github-coauthors.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24sv.configs.gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n^\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire�\1\1\0\5\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0003\4\5\0=\4\6\3B\0\3\1K\0\1\0\18hook_function\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\20typescriptreact\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\16use_lspsaga\2\ffix_pos\2\14on_attach\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 sv.configs.markdown-preview\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nvim-blame-line"] = {
    config = { "\27LJ\2\nH\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rQuestion\"blameLineVirtualTextHighlight\6g\bvim\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-blame-line"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23sv.configs.lsp.cmp\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 sv.configs.lsp.lspinstaller\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24sv.configs.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31sv.configs.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
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
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/tokyodark.nvim"
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
  ["twilight.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/twilight.nvim"
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

time([[Defining packer_plugins]], false)
-- Config for: seiya.vim
time([[Config for seiya.vim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21sv.configs.seiya\frequire\0", "config", "seiya.vim")
time([[Config for seiya.vim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 sv.configs.lsp.lspinstaller\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26sv.configs.galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\1\4\0\a\0\0316\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\6\1\3\0X\1\23�6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\6\1\4\0X\1\16�6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\6\1\5\0X\1\t�6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\6\1\6\0X\1\2�+\1\2\0L\1\2\0K\0\1\0\nAbove\nBelow\tLeft\nRight\fbufname\afn\bvim�\1\1\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0003\4\3\0=\4\5\0034\4\3\0005\5\6\0>\5\1\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\4\14highlight\14Directory\15text_align\tleft\ttext\18File Explorer\rfiletype\rNvimTree\18custom_filter\1\0\1\27always_show_bufferline\2\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24sv.configs.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21sv.configs.vsnip\frequire\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24sv.configs.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\n^\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire�\1\1\0\5\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0003\4\5\0=\4\6\3B\0\3\1K\0\1\0\18hook_function\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\20typescriptreact\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\16use_lspsaga\2\ffix_pos\2\14on_attach\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-workbench
time([[Config for nvim-workbench]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30sv.configs.nvim-workbench\frequire\0", "config", "nvim-workbench")
time([[Config for nvim-workbench]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31sv.configs.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 sv.configs.markdown-preview\frequire\0", "config", "markdown-preview.nvim")
time([[Config for markdown-preview.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-blame-line
time([[Config for nvim-blame-line]], true)
try_loadstring("\27LJ\2\nH\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rQuestion\"blameLineVirtualTextHighlight\6g\bvim\0", "config", "nvim-blame-line")
time([[Config for nvim-blame-line]], false)
-- Config for: quick-scope
time([[Config for quick-scope]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26sv.configs.quickscope\frequire\0", "config", "quick-scope")
time([[Config for quick-scope]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23sv.configs.lsp.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
