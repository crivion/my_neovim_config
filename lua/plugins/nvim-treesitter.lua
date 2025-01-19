-- Highlight, edit, and navigate code --
return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"php",
			"css",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["ak"] = { query = "@block.outer", desc = "around block" },
					["ik"] = { query = "@block.inner", desc = "inside block" },
					["ac"] = { query = "@class.outer", desc = "around class" },
					["ic"] = { query = "@class.inner", desc = "inside class" },
					["a?"] = { query = "@conditional.outer", desc = "around conditional" },
					["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
					["af"] = { query = "@function.outer", desc = "around function " },
					["if"] = { query = "@function.inner", desc = "inside function " },
					["al"] = { query = "@loop.outer", desc = "around loop" },
					["il"] = { query = "@loop.inner", desc = "inside loop" },
					["aa"] = { query = "@parameter.outer", desc = "around argument" },
					["ia"] = { query = "@parameter.inner", desc = "inside argument" },
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]k"] = { query = "@block.outer", desc = "Next block start" },
					["]f"] = { query = "@function.outer", desc = "Next function start" },
					["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
				},
				goto_previous_start = {
					["[k"] = { query = "@block.outer", desc = "Previous block start" },
					["[f"] = { query = "@function.outer", desc = "Previous function start" },
					["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
				},
			},
		},
		matchup = {
			enable = true, -- mandatory, false will disable the whole extension
			disable = {}, -- optional, list of language that will be disabled
		},
	},
	-- There are additional nvim-treesitter modules that you can use to interact
	-- with nvim-treesitter. You should go explore a few and see what interests you:
	--
	--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
