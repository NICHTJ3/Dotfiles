return {
  'ravitemer/mcphub.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for Job and HTTP requests
  },
  cmd = 'MCPHub', -- lazy load
  -- build = "npm install -g mcp-hub@latest",  -- Installs required mcp-hub npm module
  -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
  build = 'bundled_build.lua', -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
  opts = {
    use_bundled_binary = true, -- Set to true if you want to use the bundled mcp-hub binary
    -- Support cortex-key input
    global_env = function(context)
      return {
        ['input:cortex-key'] = os.getenv 'CORTEX_ACCESS_TOKEN',
      }
    end,
  },
}
