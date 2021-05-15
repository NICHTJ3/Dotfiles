local servers_with_config = {lua={
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  }
},
}

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    if servers_with_config[server] == nil then
      require'lspconfig'[server].setup{
        on_attach = require('personal.plugins.lsp').common_on_attach,
      }
    else
      print("on_attach",server,servers_with_config[server].on_attach)
      local server_config = servers_with_config[server]
      require'lspconfig'[server].setup{
        on_attach = server_config.on_attach or require('personal.plugins.lsp').common_on_attach,
        settings = server_config.settings or nil,
        filetypes = server_config.filetypes or nil,
      }
    end
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
