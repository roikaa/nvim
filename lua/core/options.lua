vim.wo.number = true -- Make line numbers default (default: false)
vim.o.relativenumber = true -- Set relative numbered lines (default: false)

vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim. (default: '')

vim.o.wrap = true -- Display lines as one long line (default: true)
vim.o.linebreak = true -- Companion to wrap, don't split words (default: false)
vim.g.showbreak = "↪" -- Tells me if there is the line is wrapped

vim.o.mouse = "a" -- Mouse options (default: 'a')

vim.o.autoindent = true -- Copy indent from current line when starting new one (default: true)

vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
vim.o.smartcase = true -- Smart case (default: false)

vim.o.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
vim.o.tabstop = 4 -- Insert n spaces for a tab (default: 8)
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
vim.o.expandtab = true -- Convert tabs to spaces (default: false)
vim.opt.smarttab = true

vim.o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
vim.o.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
vim.o.cursorline = true -- Highlight the current line (default: false)
-- vim.opt.cursorlineopt = "number"

vim.o.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
vim.o.splitright = true -- Force all vertical splits to go to the right of current window (default: false)
vim.opt.splitkeep = "screen" -- Keeps my context and cursor position less affected by window management

vim.o.hlsearch = true -- Set highlight on search (default: true)
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
--vim.o.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
vim.o.numberwidth = 2 -- Set number column width to 2 {default 4} (default: 4)
vim.o.swapfile = true -- Creates a swapfile (default: true)
vim.o.smartindent = true -- Make indenting smarter again (default: false)
-- vim.o.showtabline = 2 -- Always show tabs (default: 1)
vim.o.backspace = "indent,eol,start" -- Allow backspace on (default: 'indent,eol,start')
vim.o.pumheight = 10 -- Pop up menu height (default: 0)
vim.o.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)
vim.wo.signcolumn = "yes" -- Keep signcolumn on by default (default: 'auto')
vim.o.fileencoding = "utf-8" -- The encoding written to a file (default: 'utf-8')
-- vim.o.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
vim.o.breakindent = true -- Enable break indent (default: false)
vim.o.updatetime = 250 -- Decrease update time (default: 4000)
--vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
vim.o.backup = false -- Creates a backup file (default: false)
vim.o.writebackup = true -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)

vim.o.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience (default: 'menu,preview')
vim.opt.shortmess:append("c") -- Don't give |ins-completion-menu| messages (default: does not include 'c')
vim.opt.iskeyword:append("-") -- Hyphenated words recognized by searches (default: does not include '-')
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)

vim.opt.incsearch = true

local undo_dir = vim.fn.stdpath("cache") .. "/undo/"
vim.fn.mkdir(undo_dir, "p")
vim.opt.undodir = undo_dir
vim.o.undofile = true -- Save undo history (default: false)
vim.opt.undolevels = 1000

vim.opt.syntax = "enable"
vim.g.vimsyn_embed = "alpPrj"
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99 -- how many folds are we willing to do within a fold before we just stop folding
vim.opt.cmdheight = 2 -- Hide commandline when not in use
-- vim.opt.listchars      = {
--     -- Replace tab whitespace with -->
--     tab = '-->',
--     -- I don't care about spaces so spaces are just plain old whitespace
--     multispace = ' ',
--     -- nbsp=' ',
--     -- If a line ends with a space, I probably do care about that, show this instead of whitespace
--     trail = '',
--     -- If the line goes off the screen (for some reason), show this as the last character of the line so I know the
--     -- line continues to the right
--     extends = '⟩',
--     -- Literally the same but left
--     precedes = '⟨'
-- }
--
vim.opt.fillchars:append(",eob: ") -- Gets rid of the icky `~` filling the number column at the end of the file
