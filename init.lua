require("core.options") -- Load general options
require("core.keymaps") -- Load general keymaps
require("core.snippets") -- Load snippets

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- require("plugins.gruvbox"),
	require("plugins.telescope"),
	require("plugins.alpha"),
	require("plugins.treesitter"),
	require("plugins.bufferline"),
	require("plugins.autocompletion"),
	require("plugins.comment"),
	require("plugins.neotree"),
	require("plugins.lualine"),
	require("plugins.lsp"),
	require("plugins.none-ls"),
	require("plugins.gitsigns"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
})
local use_stylix = os.getenv("STYLIX_ENABLED") == "1"
if use_stylix then
	require("plugins.stylix")
else
	require("plugins.gruvbox")
end
-- require("plugins.tmux-session")
require("ftdetect.filetype")
require("ftplugins.tex")

