vim.opt.makeprg = "pdflatex -interaction=nonstopmode %:p"
-- vim.opt.errorformat = table.concat({
-- 	"%E!\\ LaTeX\\ %trror: %m",
-- 	"%E%f:%l: %m",
-- 	"%+WLaTeX\\ %.%#Warning: %.%#",
-- 	"%+W%.%# at lines %l--%*\\d",
-- 	"%W%>%.%#by (%.%#)",
-- 	"%W%>%.%#on input line %l.",
-- 	"%Z%m",
-- }, ",")
vim.opt.errorformat = table.concat({
	"%-P**%f",
	'%-P**"%f"',
	"%E! LaTeX %trror: %m",
	"%E%f:%l: %m",
	"%E! %m",
	"%Z<argument> %m",
	"%Cl.%l %m",
	"%-G%.%#",
}, ",")
