local plugin = require("core.pack").register_plugin

plugin "mfussenegger/nvim-dap"
plugin "jayp0521/mason-nvim-dap.nvim"

plugin { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
