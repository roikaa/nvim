-- vim.g.maplocalleader = "."
require("compiler.tex")
local function compile()
	-- Change to file directory and run make
	vim.cmd("cd %:p:h")
	vim.cmd("silent make")
	vim.cmd("cd -")
	vim.cmd("redraw")
end
local function open()
	local pdfpath = vim.fn.expand("%:p:r") .. ".pdf"
	vim.cmd("silent !zathura " .. vim.fn.shellescape(pdfpath) .. " & disown")
end
-- Set keymaps when LaTeX file is opened
local function setup_keymaps()
	vim.keymap.set(
		"n",
		"<localleader>c",
		compile,
		{ noremap = true, silent = true, buffer = true, desc = "Compile LaTeX document" }
	)
	vim.keymap.set(
		"n",
		"<localleader>f",
		open,
		{ noremap = true, silent = true, buffer = true, desc = "Open PDF in Zathura" }
	)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = setup_keymaps,
})

-- Autocommand to compile on save
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.tex",
	callback = compile,
})
