return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e",  "<cmd>Neotree toggle<cr>",           desc = "Toggle file explorer" },
    { "<leader>E",  "<cmd>Neotree focus<cr>",            desc = "Focus file explorer" },
    { "<leader>ge", "<cmd>Neotree float git_status<cr>", desc = "Git status (Neotree)" },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,

    window = {
      position = "left",
      width = 35,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["H"] = "close_all_nodes",
        ["."] = "toggle_hidden",
        ["<space>"] = "none",
      },
    },

    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules",
          ".git",
        },
      },
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },

    git_status = {
      window = { position = "float" },
    },

    default_component_configs = {
      indent = {
        indent_size = 2,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
      },
      -- icon = {
      -- 	folder_closed = "",
      -- 	folder_open = "",
      -- 	folder_empty = "",
      -- },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
  },
}
