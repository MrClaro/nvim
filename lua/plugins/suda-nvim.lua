return {
  "lambdalisue/suda.vim",
  init = function()
    vim.g["suda#prompt"] = "Contraseña: "

    if vim.fn.has("win32") == 0 then
      vim.g.suda_smart_edit = 0
    end
  end,
}
