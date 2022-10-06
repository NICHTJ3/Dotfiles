local plugin = require("core.pack").register_plugin

plugin "mfussenegger/nvim-dap"
plugin { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
plugin {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
    requires = { "mfussenegger/nvim-dap" },
}
