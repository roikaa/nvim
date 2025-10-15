vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.tex",
	command = "setfiletype latex",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.ms",
	"*.me",
	command = "setfiletype groff",
})
