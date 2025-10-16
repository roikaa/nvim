local latex = { noremap = true, silent = true, buffer = true }

-- vim.g.maplocalleader = "."

local function compile()
	local filepath = vim.fn.expand("%:p")
	local filedir = vim.fn.expand("%:p:h")
	vim.cmd(
		"silent !cd "
			.. vim.fn.shellescape(filedir)
			.. " && pdflatex -interaction=nonstopmode "
			.. vim.fn.shellescape(filepath)
	)
	vim.cmd("redraw")
end

local function open()
	local pdfpath = vim.fn.expand("%:p:r") .. ".pdf"
	vim.cmd("silent !zathura " .. vim.fn.shellescape(pdfpath) .. " & disown")
end
-- Set keymaps when LaTeX file is opened
local function setup_keymaps()
	vim.keymap.set("n", "<localleader>c", compile, vim.tbl_extend("force", latex, { desc = "Compile LaTeX document" }))
	vim.keymap.set("n", "<localleader>f", open, vim.tbl_extend("force", latex, { desc = "Open PDF in Zathura" }))
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
