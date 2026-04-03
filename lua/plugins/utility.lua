-- Utility plugins configuration for Neovim
return {
  -- SESSION MANAGEMENT
  {
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup({
        save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
        command = "VimLeavePre",
        use_git_branch = true,
        autosave = true,
        autoload = true,

        on_autoload_no_session = function()
          require("alpha").start(true)
        end,
      })

      vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save session" })
      vim.keymap.set("n", "<leader>sl", "<cmd>SessionLoad<cr>", { desc = "Load session" })
    end,
  },

  -- TODO COMMENTS
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
      vim.keymap.set("n", "<leader>td", "<cmd>TodoTrouble<cr>", { desc = "Todo (Trouble)" })
      vim.keymap.set("n", "<leader>tf", "<cmd>TodoTelescope<cr>", { desc = "Todo (Telescope)" })
    end,
  },

  -- WAKATIME
  { "wakatime/vim-wakatime", lazy = false },

  -- AUTOPAIRS
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- TYPESCRIPT TOOLS
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      settings = {
        spawn_without_cwd = true,
        composite_mode = "none",
        expose_as_code_action = "all",
        tsserver_plugins = {
          "@angular/language-server",
        },
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
        },
      },
    },
  },
}
