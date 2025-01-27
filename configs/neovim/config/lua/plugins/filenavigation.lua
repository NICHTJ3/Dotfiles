return {
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    },
    keys = {
      { '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' } },
      { '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' } },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    keys = {
      { '<leader>us', '<cmd>Neotree toggle<cr>', desc = '[U]I Toggle [S]idebar' },
      { '<leader>sF', '<cmd>Neotree toggle<cr>', desc = '[S]how [F]ile explorer' },
    },
    deactivate = function()
      vim.cmd [[Neotree close]]
    end,
    init = function()
      -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
      -- because `cwd` is not set up properly.
      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
        desc = 'Start Neo-tree with directory',
        once = true,
        callback = function()
          if package.loaded['neo-tree'] then
            return
          else
            local stats = vim.uv.fs_stat(vim.fn.argv(0))
            if stats and stats.type == 'directory' then
              require 'neo-tree'
            end
          end
        end,
      })
    end,
    opts = {
      close_if_last_window = true,
      sources = { 'filesystem', 'git_status' },
      source_selector = {
        winbar = true,
        tabs_layout = 'start',
      },
      open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<space>'] = 'none',
          ['Y'] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg('+', path, 'c')
            end,
            desc = 'Copy Path to Clipboard',
          },
          ['O'] = {
            function(state)
              require('lazy.util').open(state.tree:get_node().path, { system = true })
            end,
            desc = 'Open with System Application',
          },
          ['P'] = { 'toggle_preview', config = { use_float = false } },
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
        git_status = {
          symbols = {
            unstaged = '󰄱',
            staged = '󰱒',
          },
        },
      },
    },
    config = function(_, opts)
      local function on_move(data)
        Snacks.rename.on_rename_file(data.source, data.destination)
      end

      local events = require 'neo-tree.events'
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })
      require('neo-tree').setup(opts)
      vim.api.nvim_create_autocmd('TermClose', {
        pattern = '*lazygit',
        callback = function()
          if package.loaded['neo-tree.sources.git_status'] then
            require('neo-tree.sources.git_status').refresh()
          end
        end,
      })
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'folke/snacks.nvim',
    opts = { picker = {} },
    -- stylua: ignore
    keys={
      { '<leader>sf', function() Snacks.picker.pick('files', { layout = 'vscode', }) end, desc = 'Snacks picker [S]earch [F]iles', },
      { '<leader><space>', function() Snacks.picker.pick('files', { layout = 'vscode' }) end, desc = 'Snacks picker Search Files', },
      { '<leader>uC', function() Snacks.picker.pick 'colorschemes' end, desc = 'Colorscheme with Preview', },
      { '<leader>sg', function() Snacks.picker.pick 'grep' end, desc = '[S]each by [G]rep', },
      { '<leader>sw', function() Snacks.picker.pick 'grep_word' end, desc = '[S]earch current [W]ord', },
      { '<leader>sd', function() Snacks.picker.pick('diagnostics') end, desc = '[S]earch [D]iagnostics', },
      {
        '<leader>sn',
        function()
          Snacks.picker.pick('files', {
            layout = 'vscode',
            ---@diagnostic disable-next-line: assign-type-mismatch
            cwd = vim.fn.stdpath 'config',
            follow = true,
            exclude={'spell'}
          })
        end,
        desc = '[S]earch [N]eovim Config',
      }
    },
  },
}
