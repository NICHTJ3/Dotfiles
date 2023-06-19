return {
  "lewis6991/impatient.nvim",

  -- ======= Personal must have ========
  {
    "ten3roberts/qf.nvim",     -- Alternative to "romainl/vim-qf"
    config = function()
      -- Quickfix/Location list navigation
      vim.keymap.set("n", "<Down>", function()
        require("qf").below "visible"
      end, { noremap = true })
      vim.keymap.set("n", "<Up>", function()
        require("qf").above "visible"
      end, { noremap = true })

      -- Show quickfix
      vim.keymap.set("n", "<leader>sq", function()
        require("qf").toggle("c", true)
      end, { noremap = true })
      -- Show location
      vim.keymap.set("n", "<leader>sl", function()
        require("qf").toggle("l", true)
      end, { noremap = true })
    end,
  },

  "nvim-lua/neovim-ui",
  "wincent/loupe",   -- Better search use this or evanesco
  {
    "unblevable/quick-scope",
    -- config = function()
    --   vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
    -- end,
  },
  -- ======= TPOPE =========
  "tpope/vim-repeat",     -- Repeat with . sequences that use pluggins
  "tpope/vim-sleuth",     -- Automatically detect indentation
  "tpope/vim-surround",   -- Change/Add surrounding character
}
