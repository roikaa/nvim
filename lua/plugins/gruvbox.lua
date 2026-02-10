return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    if vim.env.STYLIX_ENABLED == "1" then
      pcall(vim.cmd.colorscheme, "stylix")
    else
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
    end
  end,
}
