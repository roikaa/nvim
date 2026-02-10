return {
  name = "stylix",
  lazy = false,
  priority = 1000,
  config = function()
    -- Check if Stylix is enabled
    if os.getenv("STYLIX_ENABLED") ~= "1" then
      return
    end

    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then
      vim.cmd("syntax reset")
    end
    vim.g.colors_name = "stylix"

    -- Read colors from stylix (they're set in the system theme)
    -- We'll read from xrdb or use a fallback command
    local function get_color(name)
      local handle = io.popen("xrdb -query | grep '" .. name .. ":' | cut -f2")
      if handle then
        local result = handle:read("*a")
        handle:close()
        return result:gsub("%s+", "")
      end
      return nil
    end

    -- Try to get colors from xresources (stylix sets these)
    local colors = {
      base00 = get_color("*.color0") or "#1d2021",
      base01 = get_color("*.color10") or "#3c3836",
      base02 = get_color("*.color11") or "#504945",
      base03 = get_color("*.color8") or "#665c54",
      base04 = get_color("*.color12") or "#bdae93",
      base05 = get_color("*.color7") or "#d5c4a1",
      base06 = get_color("*.color13") or "#ebdbb2",
      base07 = get_color("*.color15") or "#fbf1c7",
      base08 = get_color("*.color1") or "#fb4934",
      base09 = get_color("*.color9") or "#fe8019",
      base0A = get_color("*.color3") or "#fabd2f",
      base0B = get_color("*.color2") or "#b8bb26",
      base0C = get_color("*.color6") or "#8ec07c",
      base0D = get_color("*.color4") or "#83a598",
      base0E = get_color("*.color5") or "#d3869b",
      base0F = get_color("*.color14") or "#d65d0e",
    }

    -- UI Elements
    vim.api.nvim_set_hl(0, "Normal", { fg = colors.base05, bg = colors.base00 })
    vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.base05, bg = colors.base01 })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.base01 })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = colors.base01 })
    vim.api.nvim_set_hl(0, "LineNr", { fg = colors.base03, bg = colors.base00 })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.base0A, bg = colors.base01 })
    vim.api.nvim_set_hl(0, "Visual", { bg = colors.base02 })
    vim.api.nvim_set_hl(0, "VisualNOS", { bg = colors.base02 })
    
    -- Syntax
    vim.api.nvim_set_hl(0, "Comment", { fg = colors.base03, italic = true })
    vim.api.nvim_set_hl(0, "Constant", { fg = colors.base09 })
    vim.api.nvim_set_hl(0, "String", { fg = colors.base0B })
    vim.api.nvim_set_hl(0, "Character", { fg = colors.base08 })
    vim.api.nvim_set_hl(0, "Number", { fg = colors.base09 })
    vim.api.nvim_set_hl(0, "Boolean", { fg = colors.base09 })
    vim.api.nvim_set_hl(0, "Float", { fg = colors.base09 })
    
    vim.api.nvim_set_hl(0, "Identifier", { fg = colors.base08 })
    vim.api.nvim_set_hl(0, "Function", { fg = colors.base0D })
    
    vim.api.nvim_set_hl(0, "Statement", { fg = colors.base0E })
    vim.api.nvim_set_hl(0, "Conditional", { fg = colors.base0E })
    vim.api.nvim_set_hl(0, "Repeat", { fg = colors.base0E })
    vim.api.nvim_set_hl(0, "Label", { fg = colors.base0E })
    vim.api.nvim_set_hl(0, "Operator", { fg = colors.base05 })
    vim.api.nvim_set_hl(0, "Keyword", { fg = colors.base0E })
    vim.api.nvim_set_hl(0, "Exception", { fg = colors.base08 })
    
    vim.api.nvim_set_hl(0, "PreProc", { fg = colors.base0A })
    vim.api.nvim_set_hl(0, "Include", { fg = colors.base0D })
    vim.api.nvim_set_hl(0, "Define", { fg = colors.base0E })
    vim.api.nvim_set_hl(0, "Macro", { fg = colors.base08 })
    vim.api.nvim_set_hl(0, "PreCondit", { fg = colors.base0A })
    
    vim.api.nvim_set_hl(0, "Type", { fg = colors.base0A })
    vim.api.nvim_set_hl(0, "StorageClass", { fg = colors.base0A })
    vim.api.nvim_set_hl(0, "Structure", { fg = colors.base0E })
    vim.api.nvim_set_hl(0, "Typedef", { fg = colors.base0A })
    
    vim.api.nvim_set_hl(0, "Special", { fg = colors.base0C })
    vim.api.nvim_set_hl(0, "SpecialChar", { fg = colors.base0F })
    vim.api.nvim_set_hl(0, "Tag", { fg = colors.base0A })
    vim.api.nvim_set_hl(0, "Delimiter", { fg = colors.base0F })
    vim.api.nvim_set_hl(0, "SpecialComment", { fg = colors.base0C })
    vim.api.nvim_set_hl(0, "Debug", { fg = colors.base08 })
    
    -- Misc
    vim.api.nvim_set_hl(0, "Underlined", { fg = colors.base0D, underline = true })
    vim.api.nvim_set_hl(0, "Error", { fg = colors.base08, bg = colors.base00 })
    vim.api.nvim_set_hl(0, "Todo", { fg = colors.base0A, bg = colors.base01, bold = true })
    
    -- Search
    vim.api.nvim_set_hl(0, "Search", { fg = colors.base01, bg = colors.base0A })
    vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.base01, bg = colors.base09 })
    
    -- Statusline
    vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.base04, bg = colors.base02 })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.base03, bg = colors.base01 })
    
    -- Tabline
    vim.api.nvim_set_hl(0, "TabLine", { fg = colors.base03, bg = colors.base01 })
    vim.api.nvim_set_hl(0, "TabLineFill", { fg = colors.base03, bg = colors.base01 })
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.base0B, bg = colors.base02 })
    
    -- Popup Menu
    vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.base05, bg = colors.base01 })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.base01, bg = colors.base05 })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.base02 })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.base04 })
  end
}
