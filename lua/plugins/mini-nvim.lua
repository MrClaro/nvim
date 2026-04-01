return {
  -- MINI.NVIM
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      -- Textobjects avançados (a), i), etc)
      require("mini.ai").setup()

      -- Surround (ys, ds, cs)
      require("mini.surround").setup()

      -- Hightlight the word under the cursor
      require("mini.cursorword").setup()

      -- Move lines/selections with Alt+hjkl
      require("mini.move").setup()

      -- Hightlight of patterns (hex colors, TODO, FIXME, etc)
      require("mini.hipatterns").setup({
        highlighters = {
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      })
    end,
  },

  -- -- MINI.ICONS
  -- {
  -- 	"echasnovski/mini.icons",
  -- 	version = false,
  -- 	opts = {},
  -- 	init = function()
  -- 		package.preload["nvim-web-devicons"] = function()
  -- 			require("mini.icons").mock_nvim_web_devicons()
  -- 			return package.loaded["nvim-web-devicons"]
  -- 		end
  -- 	end,
  -- },
}
