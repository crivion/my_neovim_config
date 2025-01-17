-- Close a buffer --
function close_buffer(bufnr, force)
	if not bufnr or bufnr == 0 then
		bufnr = vim.api.nvim_get_current_buf()
	end
	if pcall(require, "mini.bufremove") and #vim.api.nvim_list_bufs() > 1 then
		if not force and vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
			local bufname = vim.fn.expand("%")
			local empty = bufname == ""
			if empty then
				bufname = "Untitled"
			end
			local confirm =
				vim.fn.confirm(('Save changes to "%s"?'):format(bufname), "&Yes\n&No\n&Cancel", 1, "Question")
			if confirm == 1 then
				if empty then
					return
				end
				vim.cmd.write()
			elseif confirm == 2 then
				force = true
			else
				return
			end
		end
		require("mini.bufremove").delete(bufnr, force)
	else
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
		vim.cmd(("silent! %s %d"):format((force or buftype == "terminal") and "bdelete!" or "confirm bdelete", bufnr))
	end
end

-- Close all buffers
-- @param keep_current? boolean Whether or not to keep the current buffer (default: false)
-- @param force? boolean Whether or not to force close the buffers or confirm changes (default: false)
function close_all_buffers(keep_current, force)
	if keep_current == nil then
		keep_current = false
	end
	local current = vim.api.nvim_get_current_buf()

	-- Use vim.api.nvim_list_bufs() instead of vim.t.bufs
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		-- Exclude 'neo-tree' buffers and other special buffers based on their 'buftype'
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
		if
			vim.api.nvim_buf_is_loaded(bufnr)
			and (not keep_current or bufnr ~= current)
			and buftype ~= "nofile"
			and buftype ~= "quickfix"
		then
			close_buffer(bufnr, force)
		end
	end
end
