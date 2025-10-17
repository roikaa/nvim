local makeprg = "pdflatex -interaction=nonstopmode -synctex=-1 %:p"
local errorformat = table.concat({
	"%+P(%f",
	"%+P<%f>",
	"%E! LaTeX %trror: %m",
	"%E! %m",
	"%Cl.%l %m",
	"%+WLaTeX %.%#Warning: %.%#",
	"%+W%.%#by (%.%#)",
	"%+W%.%#on input line %l.",
	"%-G%.%#",
}, ",")

vim.opt.makeprg = makeprg
vim.opt.errorformat = errorformat
