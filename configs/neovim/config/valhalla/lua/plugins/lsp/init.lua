return {
  {
    {
      "williamboman/mason.nvim",
      config = function()
        require "plugins.lsp.config.mason"
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require "plugins.lsp.config.mason-config"
      end,
    },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  {
    "jose-elias-alvarez/null-ls.nvim",     -- Support more linters/formatters
    config = function()
      local config = require "plugins.lsp.config.null-ls"
      config.setup()
    end,
  },

  -- Language specific packages for lsp
  {
    "folke/neodev.nvim",
    "b0o/SchemaStore.nvim",
    { "simrat39/rust-tools.nvim", branch = "modularize_and_inlay_rewrite", ft = { "rust" } },
    "jose-elias-alvarez/typescript.nvim",
    "Hoffs/omnisharp-extended-lsp.nvim",
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup {
        symbol_in_winbar = {
          enable = true,
          separator = "  ",
          show_file = true,
        },
        code_action_lightbulb = {
          sign = true,
          virtual_text = false,
        },
      }
    end,
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").setup {}
      end,
    },
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        vim.g.symbols_outline = {
          position = "right",
          auto_preview = false,
          keymaps = {           -- These keymaps can be a string or a table for multiple keys
            close = { "<Esc>", "q" },
            goto_location = "gd",
            focus_location = "<CR>",
            hover_symbol = "<C-space>",
            toggle_preview = "K",
            rename_symbol = "r",
            code_actions = "a",
          },
        }
      end,
    },
  },

  {
    "vigoux/notifier.nvim",
    config = function()
      require("notifier").setup {
        -- You configuration here
      }
    end,
  },

  -- CMP
  {
    -- "hrsh7th/nvim-cmp",
    "williamboman/nvim-cmp",
    branch = "feat/docs-preview-window",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-path",
      "andersevenrud/cmp-tmux",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "petertriho/cmp-git",
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "onsails/lspkind-nvim",
        config = function()
          require("lspkind").init()
        end,
      },
    },
    config = function()
      require("plugins.lsp.config.cmp").setup()
    end,
  },

  -- ======== Trouble ==========
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
      vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })
    end,
  },
}