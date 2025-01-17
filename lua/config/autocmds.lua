-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Keep cursor position across files / buffers
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("RestoreCursor", { clear = true }),
	callback = function()
		local line = vim.fn.line([['"]]) -- Get the line number of the last cursor position
		if
			line >= 1
			and line <= vim.fn.line("$")
			and vim.bo.filetype ~= "commit"
			and not vim.tbl_contains({ "xxd", "gitrebase" }, vim.bo.filetype)
		then
			vim.cmd('normal! g`"') -- Restore cursor position
		end
	end,
})
