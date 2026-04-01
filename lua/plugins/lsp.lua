return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "b0o/schemastore.nvim",
      "ellisonleao/dotenv.nvim",
      "saghen/blink.cmp",
      { "j-hui/fidget.nvim", opts = {} },
    },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- ==========================================================================
      -- Keymaps on LspAttach
      -- ==========================================================================
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(event)
          local buf = event.buf
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = buf, desc = desc })
          end
          pcall(vim.keymap.del, "n", "K", { buffer = buf })
          map("K", "mzK`z", "Join lines up")

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("gr", vim.lsp.buf.references, "References")
          map("gt", vim.lsp.buf.type_definition, "Go to type definition")
          map("<A-k>", vim.lsp.buf.hover, "Hover docs")
          map("<leader>k", vim.lsp.buf.signature_help, "Signature help")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>dl", vim.diagnostic.open_float, "Diagnostic float")
        end,
      })

      -- ==========================================================================
      -- Diagnostics
      -- ==========================================================================
      local signs = {
        Error = " ", -- nf-fa-times_circle
        Warn = " ", -- nf-fa-exclamation_triangle
        Hint = "󰠠 ", -- nf-mdi-lightbulb-on-outline
        Info = " ", -- nf-fa-info_circle
      }

      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.HINT] = signs.Hint,
            [vim.diagnostic.severity.INFO] = signs.Info,
          },
        },
      })

      vim.lsp.handlers["textDocument/hover"] = nil
      --      vim.lsp.handlers["textDocument/signatureHelp"] = nil

      -- ==========================================================================
      -- Servers
      -- ==========================================================================
      local servers = {
        angularls = {
          filetypes = { "typescript", "html", "typescriptreact", "htmlangular", "typescript.tsx" },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              global = { vim = true },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
        kotlin_language_server = {},
        dockerls = {},
        docker_compose_language_service = {},
        marksman = {},
        cssls = {},
        tailwindcss = {},
        html = {},
        pyright = {},
      }

      -- ==========================================================================
      -- Mason Setup
      -- ==========================================================================
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = false,
        handlers = {
          function(server_name)
            if servers[server_name] then
              local config = servers[server_name] or {}
              config.capabilities = capabilities

              if server_name == "angularls" then
                config.on_attach = function(client)
                  client.server_capabilities.renameProvider = false
                end
              end

              require("lspconfig")[server_name].setup(config)
            end
          end,
        },
      })
    end,
  },

  { "b0o/schemastore.nvim", lazy = true },
}
