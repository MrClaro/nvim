return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format buffer",
    },
  },

  opts = {
    default_format_opts = {
      lsp_fallback = true,
    },

    formatters_by_ft = {
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      scss = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      htmlangular = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      jsonc = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      python = { "ruff_format" },
      kotlin = { lsp_format = "prefer" },
      java = { lsp_format = "prefer" },
      dart = { "dart_format" },
    },

    format_on_save = {
      timeout_ms = 2000,
      lsp_fallback = true,
    },

    formatters = {
      prettierd = {
        command = vim.fn.stdpath("data") .. "/mason/bin/prettierd",
      },
      prettier = {
        command = vim.fn.stdpath("data") .. "/mason/bin/prettier",
      },
      stylua = {
        command = vim.fn.stdpath("data") .. "/mason/bin/stylua",
      },
      shfmt = {
        command = vim.fn.stdpath("data") .. "/mason/bin/shfmt",
        args = { "-i", "2", "-ci" },
      },
      ruff_format = {
        command = vim.fn.stdpath("data") .. "/mason/bin/ruff",
      },
    },
  },
}
