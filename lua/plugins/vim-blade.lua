return {
	{
		"jwalton512/vim-blade",
	},
	{
		"ricardoramirezr/blade-nav.nvim",
		dependencies = { -- totally optional
			"hrsh7th/nvim-cmp", -- if using nvim-cmp
		},
		ft = { "blade", "php" },
		opts = {
			close_tag_on_complete = true,
		},
	},
}
