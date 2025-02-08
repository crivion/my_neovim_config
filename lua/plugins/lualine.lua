-- lualine / pretty fancy status line --
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		options = {
			globalstatus = true,
		},
		sections = {
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
		},
	},
}
