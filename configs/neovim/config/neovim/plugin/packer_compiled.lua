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
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23sv.configs.comment\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n‘\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\16integration\1\0\0\rnvimtree\1\0\0\1\0\3\fenabled\2\22transparent_panel\1\14show_root\2\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-git"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-look",
    url = "https://github.com/octaltree/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/committia.vim",
    url = "https://github.com/rhysd/committia.vim"
  },
  ["formatter.nvim"] = {
    commands = { "Format", "FormatWrite" },
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25sv.configs.formatter\frequire\0" },
    keys = { { "", "<leader>d" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["github-coauthors.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/github-coauthors.nvim",
    url = "https://github.com/cwebster2/github-coauthors.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24sv.configs.gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["incline.nvim"] = {
    config = { "\27LJ\2\nŠ\1\0\1\6\0\t\0\0186\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\2\a\1\4\0X\2\3€'\2\5\0L\2\2\0X\2\a€6\2\0\0009\2\6\0029\2\a\2\18\4\1\0'\5\b\0B\2\3\2\18\1\2\0L\1\2\0\a:t\16fnamemodify\afn\14[No name]\5\bbuf\22nvim_buf_get_name\bapi\bvim«\3\1\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\0035\4\n\0005\5\t\0=\5\v\0045\5\f\0=\5\r\4=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0004\4\0\0=\4\19\3=\3\20\2B\0\2\1K\0\1\0\vignore\14filetypes\1\0\4\rwintypes\fspecial\rbuftypes\fspecial\21unlisted_buffers\2\18floating_wins\2\vwindow\fpadding\1\0\2\nright\3\1\tleft\3\1\vmargin\rvertical\1\0\2\btop\3\1\vbottom\3\0\15horizontal\1\0\0\1\0\2\nright\3\1\tleft\3\1\14placement\1\0\2\rvertical\btop\15horizontal\nright\1\0\3\nwidth\bfit\17padding_char\6 \vzindex\3d\vrender\1\0\1\23debounce_threshold\3\30\0\nsetup\fincline\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/incline.nvim",
    url = "https://github.com/b0o/incline.nvim"
  },
  loupe = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/loupe",
    url = "https://github.com/wincent/loupe"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nj\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\23code_action_prompt\1\0\0\1\0\1\venable\1\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 sv.configs.markdown-preview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23sv.configs.lsp.cmp\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\nå\1\0\0\4\0\v\0\0146\0\0\0'\2\1\0B\0\2\0025\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\6\0009\0\a\0009\0\b\0'\2\t\0005\3\n\0B\0\3\1K\0\1\0\1\0\2\fpattern\6*\fcommand#lua require('lint').try_lint()$BufNewFile,BufRead,BufWritePost\24nvim_create_autocmd\bapi\bvim\15dockerfile\1\0\0\1\2\0\0\rhadolint\18linters_by_ft\tlint\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 sv.configs.lsp.lspinstaller\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\nd\0\0\a\0\b\0\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\4B\0\4\1K\0\1\0\topen\fspectre\frequire\15<leader>as\6n\bset\vkeymap\bvim\0" },
    keys = { { "", "<leader>as" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24sv.configs.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31sv.configs.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26sv.configs.quickscope\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["tagalong.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/tagalong.vim",
    url = "https://github.com/AndrewRadev/tagalong.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\nS\0\0\3\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0B\1\1\1K\0\1\0\rMappings\nSetup\25sv.configs.telescope\frequire\0" },
    keys = { { "", "<leader>lf" }, { "", "<leader>ev" }, { "", "<leader>lb" }, { "", "<leader>/" }, { "", "<leader>sw" }, { "", "<leader>lca" }, { "", "<leader>lp" }, { "", "<c-p>" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n \1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\27<cmd>TroubleToggle<CR>\15<leader>tt\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-markdown"] = {
    config = { '\27LJ\2\n?\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0"vim_markdown_folding_disabled\6g\bvim\0' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-qf",
    url = "https://github.com/romainl/vim-qf"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-tmux-clipboard"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-tmux-clipboard",
    url = "https://github.com/roxma/vim-tmux-clipboard"
  },
  ["vim-tmux-focus-events"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-tmux-focus-events",
    url = "https://github.com/tmux-plugins/vim-tmux-focus-events"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21sv.configs.vsnip\frequire\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["windline.nvim"] = {
    config = { "\27LJ\2\nb\0\0\3\0\6\0\n6\0\0\0009\0\1\0)\1\3\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\24sv.configs.windline\frequire\15laststatus\6o\bvim\0" },
    loaded = true,
    path = "/Users/trent.nicholson/.local/share/nvim/site/pack/packer/start/windline.nvim",
    url = "https://github.com/windwp/windline.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: quick-scope
time([[Config for quick-scope]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26sv.configs.quickscope\frequire\0", "config", "quick-scope")
time([[Config for quick-scope]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23sv.configs.comment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23sv.configs.lsp.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 sv.configs.lsp.lspinstaller\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: incline.nvim
time([[Config for incline.nvim]], true)
try_loadstring("\27LJ\2\nŠ\1\0\1\6\0\t\0\0186\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\2\a\1\4\0X\2\3€'\2\5\0L\2\2\0X\2\a€6\2\0\0009\2\6\0029\2\a\2\18\4\1\0'\5\b\0B\2\3\2\18\1\2\0L\1\2\0\a:t\16fnamemodify\afn\14[No name]\5\bbuf\22nvim_buf_get_name\bapi\bvim«\3\1\0\6\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\0035\4\n\0005\5\t\0=\5\v\0045\5\f\0=\5\r\4=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0004\4\0\0=\4\19\3=\3\20\2B\0\2\1K\0\1\0\vignore\14filetypes\1\0\4\rwintypes\fspecial\rbuftypes\fspecial\21unlisted_buffers\2\18floating_wins\2\vwindow\fpadding\1\0\2\nright\3\1\tleft\3\1\vmargin\rvertical\1\0\2\btop\3\1\vbottom\3\0\15horizontal\1\0\0\1\0\2\nright\3\1\tleft\3\1\14placement\1\0\2\rvertical\btop\15horizontal\nright\1\0\3\nwidth\bfit\17padding_char\6 \vzindex\3d\vrender\1\0\1\23debounce_threshold\3\30\0\nsetup\fincline\frequire\0", "config", "incline.nvim")
time([[Config for incline.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n‘\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\16integration\1\0\0\rnvimtree\1\0\0\1\0\3\fenabled\2\22transparent_panel\1\14show_root\2\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
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
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31sv.configs.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nj\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\23code_action_prompt\1\0\0\1\0\1\venable\1\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: windline.nvim
time([[Config for windline.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\3\0\6\0\n6\0\0\0009\0\1\0)\1\3\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\24sv.configs.windline\frequire\15laststatus\6o\bvim\0", "config", "windline.nvim")
time([[Config for windline.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n \1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\27<cmd>TroubleToggle<CR>\15<leader>tt\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FormatWrite lua require("packer.load")({'formatter.nvim'}, { cmd = "FormatWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>d <cmd>lua require("packer.load")({'formatter.nvim'}, { keys = "<lt>leader>d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>lf <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>lf", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-p> <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>c-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>lb <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>lb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>ev <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>ev", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>as <cmd>lua require("packer.load")({'nvim-spectre'}, { keys = "<lt>leader>as", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>/ <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>/", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>sw <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>sw", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>lca <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>lca", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>lp <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>lp", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'tagalong.vim'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType terraform ++once lua require("packer.load")({'vim-terraform'}, { ft = "terraform" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'tagalong.vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType dockerfile ++once lua require("packer.load")({'nvim-lint'}, { ft = "dockerfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'tagalong.vim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/vim-terraform/ftdetect/hcl.vim]], true)
vim.cmd [[source /Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/vim-terraform/ftdetect/hcl.vim]]
time([[Sourcing ftdetect script at: /Users/trent.nicholson/.local/share/nvim/site/pack/packer/opt/vim-terraform/ftdetect/hcl.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
