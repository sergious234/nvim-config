return {
	{
		"https://github.com/stevearc/oil.nvim",
		dependencies = {
			{ 'echasnovski/mini.nvim',       version = '*' },
			{ "nvim-tree/nvim-web-devicons", opts = {} },
			{
				"benomahony/oil-git.nvim",
				dependencies = { "stevearc/oil.nvim" },
				-- No opts or config needed! Works automatically
			}
		}
	},
	"https://github.com/echasnovski/mini.pick",
	{ "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/chomosuke/typst-preview.nvim",
	{
		'https://github.com/neovim/nvim-lspconfig',
	},
	"https://github.com/mason-org/mason.nvim",
	{ 'https://github.com/NvChad/showkeys',                 opt = true },
	"https://github.com/L3MON4D3/LuaSnip",

	{
		'mrcjkb/rustaceanvim',
		version = '^6', -- Recommended
		lazy = false, -- This plugin is already lazy
	},


	"folke/which-key.nvim",
}
