-- this is a custom latex-zathura plugin
--

require("compiler.tex")
local function compile()
	-- Change to file directory and run make
	vim.cmd("cd %:p:h")
	vim.cmd("silent make")
	vim.cmd("cd -")
	vim.cmd("redraw")
	vim.cmd("cwindow")
end

-- Open PDF with Zathura function
local function open()
	local pdf = vim.fn.expand("%:p:r") .. ".pdf"
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	local file = vim.fn.expand("%:p")
	vim.cmd(
		"silent !zathura "
			.. vim.fn.shellescape(pdf)
			.. " --synctex-forward="
			.. line
			.. ":"
			.. col
			.. ":"
			.. file
			.. " & disown"
	)
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
		"<localleader>r",
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
