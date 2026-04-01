-- Plugins focused on productivity, refactoring, and symbol navigation.
return {
  -- NEOGEN (Docstring/Comment Generation)
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cn",
        function()
          require("neogen").generate({})
        end,
        desc = "Generate docstring",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- MINI.BRACKETED (Bracket Navigation)
  {
    "nvim-mini/mini.bracketed",
    event = "BufReadPost",
    config = function()
      require("mini.bracketed").setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },

  -- DIAL.NVIM (Increment/Decrement)
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<C-a>",
        function()
          return require("dial.map").inc_normal()
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_normal()
        end,
        expr = true,
        desc = "Decrement",
      },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },

  -- SYMBOLS-OUTLINE
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols outline" } },
    cmd = "SymbolsOutline",
    opts = { position = "right" },
  },

  -- REFACTORING.NVIM
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>re",
        function()
          require("refactoring").refactor("Extract Function")
        end,
        mode = "v",
        desc = "Extract function",
      },
      {
        "<leader>rf",
        function()
          require("refactoring").refactor("Extract Function To File")
        end,
        mode = "v",
        desc = "Extract function to file",
      },
      {
        "<leader>rv",
        function()
          require("refactoring").refactor("Extract Variable")
        end,
        mode = "v",
        desc = "Extract variable",
      },
      {
        "<leader>ri",
        function()
          require("refactoring").refactor("Inline Variable")
        end,
        mode = { "n", "v" },
        desc = "Inline variable",
      },
      {
        "<leader>rI",
        function()
          require("refactoring").refactor("Inline Function")
        end,
        desc = "Inline function",
      },
      {
        "<leader>rb",
        function()
          require("refactoring").refactor("Extract Block")
        end,
        desc = "Extract block",
      },
    },
    config = true,
  },
}
