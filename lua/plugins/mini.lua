-- Collection of various small independent plugins/modules
return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		-- local statusline = require 'mini.statusline'
		-- -- set use_icons to true if you have a Nerd Font
		-- statusline.setup {
		--   use_icons = vim.g.have_nerd_font,
		--   content = {
		--     active = function()
		--       -- Get the current window and buffer filetype
		--       local win_id = vim.api.nvim_get_current_win()
		--       local buf_ft = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win_id), 'filetype')
		--
		--       -- If the current buffer is NeoTree, hide the statusline
		--       -- Default active statusline content
		--       local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
		--       local git = MiniStatusline.section_git { trunc_width = 75 }
		--       local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
		--       local filename = MiniStatusline.section_filename { trunc_width = 140 }
		--       local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
		--       local location = MiniStatusline.section_location { trunc_width = 75 }
		--
		--       return MiniStatusline.combine_groups {
		--         { hl = mode_hl, strings = { mode } },
		--         { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
		--         '%<', -- Mark truncation point
		--         { hl = 'MiniStatuslineFilename', strings = { filename } },
		--         '%=', -- Aligns following to the right
		--         { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
		--         { hl = mode_hl, strings = { location } },
		--       }
		--     end,
		--     inactive = nil, -- Use the default inactive behavior
		--   },
		-- }

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		-- statusline.section_location = function()
		--   return '%2l:%-2v'
		-- end

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
