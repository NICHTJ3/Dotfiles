return {
  'olimorris/codecompanion.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    { 'folke/snacks.nvim', opt = true },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      optional = true,
      opts = {
        file_types = { 'codecompanion' },
      },
      ft = { 'codecompanion' },
    },
  },
  opts = function()
    local opts = {
      display = {
        action_palette = {
          provider = 'snacks',
        },
      },
      memory = {
        default = {
          description = 'Collection of common files for all projects',
          files = {
            '.clinerules',
            '.cursorrules',
            '.goosehints',
            '.rules',
            '.windsurfrules',
            '.github/copilot-instructions.md',
            'AGENT.md',
            'AGENTS.md',
            { path = 'CLAUDE.md', parser = 'claude' },
            { path = 'CLAUDE.local.md', parser = 'claude' },
            { path = '~/.claude/CLAUDE.md', parser = 'claude' },
          },
        },
        opts = {
          chat = {
            default_memory = 'default',
          },
        },
      },
      strategies = {
        chat = {
          keymaps = {
            close = {
              modes = {
                n = 'q',
              },
              index = 3,
              callback = 'keymaps.close',
              description = 'Close Chat',
            },
            stop = {
              modes = {
                n = '<C-c',
              },
              index = 4,
              callback = 'keymaps.stop',
              description = 'Stop Request',
            },
          },
        },
      },
      extensions = {},
    }

    if Core.has 'mcphub.nvim' then
      opts.extensions.mcphub = {
        callback = 'mcphub.extensions.codecompanion',
        opts = {
          -- MCP Tools
          make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
          show_server_tools_in_chat = false, -- Show individual tools in chat completion (when make_tools=true)
          add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
          show_result_in_chat = true, -- Show tool results directly in chat buffer
          format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
          -- MCP Resources
          make_vars = true, -- Convert MCP resources to #variables for prompts
          -- MCP Prompts
          make_slash_commands = true, -- Add MCP prompts as /slash commands
        },
      }
    end
    return opts
  end,
  keys = {
    { '<leader>a', mode = { 'n', 'v' }, '', desc = '+[A]I' },
    { '<leader>af', mode = { 'n', 'v' }, '<cmd>CodeCompanion /fix<cr>', desc = '[A]I [F]ix' },
    {
      '<leader>ai',
      mode = { 'v' },
      function()
        Snacks.input.input({
          prompt = '[AI] Inline: What would you like help with? ',
          win = {
            relative = 'cursor',
            row = -2,
            col = 0,
          },
        }, function(input)
          if input and input ~= '' then
            vim.cmd('CodeCompanion ' .. input)
          else
            vim.notify 'CodeCompanion: No input provided'
          end
        end)
      end,
      desc = '[A]I [I]nline',
    },
    { '<leader>at', mode = { 'v' }, '<cmd>CodeCompanion /tests<cr>', desc = '[A]I [T]est' },
    {
      '<leader>at',
      mode = { 'n' },
      function()
        vim.cmd '%CodeCompanion /tests'
      end,
      desc = '[A]I [T]est',
    },
    { '<leader>ac', mode = { 'n', 'v' }, '<cmd>CodeCompanionChat Toggle<cr>', desc = '[A]I [C]hat toggle' },
    { '<leader>aC', mode = { 'n', 'v' }, '<cmd>CodeCompanionChat<cr>', desc = '[A]I [C]reate a new chat' },
    { '<leader>aa', mode = { 'n', 'v' }, '<cmd>CodeCompanionAction<cr>', desc = '[A]I [A]ction' },
  },
}
