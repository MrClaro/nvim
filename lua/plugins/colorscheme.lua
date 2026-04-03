return {
  "jesseleite/nvim-noirbuddy",
  dependencies = {
    { "tjdevries/colorbuddy.nvim" },
  },
  config = function()
    require("noirbuddy").setup({
      preset = "minimal",
      colors = {
        primary = "#ff0000",
      },
    })
  end,
}
