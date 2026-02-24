return { 
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      -- Optional: customize gruvbox settings
      contrast = "hard", -- hard, soft, or empty string
    })
    vim.cmd([[colorscheme gruvbox]])
  end,
}
