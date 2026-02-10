return {
  name = "stylix",
  lazy = false,
  priority = 1000,
  config = function()
    -- Get colors from environment variable set by Nix
    local colors_json = os.getenv("STYLIX_COLORS")
    if not colors_json then
      return -- Stylix not enabled, skip
    end
    
    -- Parse the JSON colors
    local colors = vim.fn.json_decode(colors_json)
    
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then
      vim.cmd("syntax reset")
    end
    vim.g.colors_name = "stylix"
    
    -- Apply highlight groups
    vim.api.nvim_set_hl(0, "Normal", { fg = colors.base05, bg = colors.base00 })
    vim.api.nvim_set_hl(0, "Comment", { fg = colors.base03, italic = true })
    vim.api.nvim_set_hl(0, "Constant", { fg = colors.base09 })
    vim.api.nvim_set_hl(0, "String", { fg = colors.base0B })
    vim.api.nvim_set_hl(0, "Keyword", { fg = colors.base0E })
    vim.api.nvim_set_hl(0, "Function", { fg = colors.base0D })
    vim.api.nvim_set_hl(0, "Type", { fg = colors.base0A })
    vim.api.nvim_set_hl(0, "Identifier", { fg = colors.base08 })
    vim.api.nvim_set_hl(0, "Special", { fg = colors.base0C })
    vim.api.nvim_set_hl(0, "PreProc", { fg = colors.base0A })
    vim.api.nvim_set_hl(0, "Underlined", { fg = colors.base0D, underline = true })
    vim.api.nvim_set_hl(0, "Error", { fg = colors.base08, bg = colors.base00 })
    vim.api.nvim_set_hl(0, "Todo", { fg = colors.base0A, bg = colors.base00 })
    
    -- Add more highlight groups as needed
  end
}
