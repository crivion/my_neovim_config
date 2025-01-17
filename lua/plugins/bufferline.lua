-- show buffers as "tabs" --
return {
	"akinsho/bufferline.nvim",
	version = "*", -- Install the latest stable version
	dependencies = "nvim-tree/nvim-web-devicons", -- Optional: For file icons
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none", -- Show buffer numbers (or set to `none` to disable)
				close_command = 'lua require("mini.bufremove").delete(vim.fn.bufnr())',
				right_mouse_command = "bdelete! %d", -- Right-click close
				left_mouse_command = "buffer %d", -- Left-click to switch buffer
				middle_mouse_command = nil, -- Disable middle-click
				diagnostics = "nvim_lsp", -- Show LSP diagnostics in the bufferline
				offsets = {
					{
						filetype = "neo-tree", -- Adjust offset if using a file tree
						text = "File Explorer",
						text_align = "center",
					},
				},
				separator_style = "none", -- Choose separator style: 'slant', 'thick', 'thin', etc.
				show_buffer_icons = true, -- Show filetype icons
				show_buffer_close_icons = false,
				show_close_icon = false,
				enforce_regular_tabs = false,
				always_show_bufferline = true, -- Always show bufferline
			},
		})
	end,
}
