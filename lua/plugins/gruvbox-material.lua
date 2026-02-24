return {
	-- "sainnhe/gruvbox-material",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	-- Optionally configure and load the colorscheme
	-- 	-- directly inside the plugin declaration.
	-- 	vim.g.gruvbox_material_transparent_background = 2
	-- 	vim.g.gruvbox_material_enable_italic = true
	-- 	vim.cmd.colorscheme("gruvbox-material")
	-- end,
	"f4z3r/gruvbox-material.nvim",
	name = "gruvbox-material",
	lazy = false,
	priority = 1000,
	opts = {
		italics = true,
		contrast = "hard", -- or "medium", "soft"
		comments = {
			italics = true,
		},
		background = {
			transparent = false,
		},
		float = {
			force_background = false,
			background_color = nil,
		},
		signs = {
			force_background = false,
			background_color = nil,
		},
		customize = nil,
	},
}
