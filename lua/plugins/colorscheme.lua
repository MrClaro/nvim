return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,

      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#010101",
          crust = "#020202",
        },
      },

      custom_highlights = function(colors)
        return {
          ["@keyword"] = { fg = colors.red, style = { "bold" } },
          ["@keyword.function"] = { fg = colors.red },
          Statement = { fg = colors.red, bold = true },
          ["@function"] = { fg = colors.maroon },
          Function = { fg = colors.maroon },
          CursorLine = { bg = "#0a0a0a" },
          LineNr = { fg = "#444444" },
          CursorLineNr = { fg = colors.red },
        }
      end,

      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        functions = {},
        keywords = { "bold" },
        variables = {},
        numbers = {},
      },

      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
        inlay_hints = { background = true },
      },

      integrations = {
        treesitter = true,
        semantic_tokens = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        cmp = true,
        gitsigns = true,
        mason = true,
        neotree = true,
        telescope = { enabled = true, style = "nvchad" },
        which_key = true,
      },
    },

    vim.api.nvim_set_hl(0, "@tag.builtin.angular", { link = "Type", bold = true }),
    vim.api.nvim_set_hl(0, "@tag.angular", { link = "StorageClass" }),
    vim.api.nvim_set_hl(0, "@attribute.angular", { link = "Special" }),

    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
