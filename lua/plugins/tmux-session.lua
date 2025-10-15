-- Only save sessions, don't auto-restore
-- Tmux-resurrect will handle restoration

local session_dir = vim.fn.stdpath("data") .. "/sessions/"
vim.fn.mkdir(session_dir, "p")

-- Save session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		-- Create session filename based on current directory
		local cwd = vim.fn.getcwd()
		local session_file = session_dir .. cwd:gsub("/", "%%") .. ".vim"
		vim.cmd("mksession! " .. session_file)
	end,
})

-- Don't auto-restore - let tmux-resurrect handle it
