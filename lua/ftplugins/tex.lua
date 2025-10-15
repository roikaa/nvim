local latex = { noremap = true, silent = true, buffer = true }

-- vim.g.maplocalleader =  "."

-- Set keymap to Compile tex
vim.keymap.set("n", "<localleader>c", '<cmd>echo "Example 2"<CR>', latex)
vim.keymap.set("n", "<localleader>f", "<cmd>silent !pdflatex %:p <CR>", latex)
