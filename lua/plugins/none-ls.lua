return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local diagnostics = null_ls.builtins.diagnostics

    require("mason-null-ls").setup({
      ensure_installed = {
        "eslint_d",
        "checkmake",
      },
      automatic_installation = true,
    })

    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file({
              ".eslintrc",
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.json",
              "eslint.config.js",
              "eslint.config.mjs",
            })
          end,
        }),
        diagnostics.checkmake,
      },
    })
  end,
}
