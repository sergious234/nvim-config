return {
	{ "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{
		'https://github.com/neovim/nvim-lspconfig',
	},
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/L3MON4D3/LuaSnip",

	{ 'https://github.com/NvChad/showkeys',                 opt = true },
	"folke/which-key.nvim",
	"norcalli/nvim-colorizer.lua",

	{
		'chomosuke/typst-preview.nvim',
		lazy = false, -- or ft = 'typst'
		version = '1.*',
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},

	-- LSP loading bar
	{
		"j-hui/fidget.nvim",
		opts = {
		},
	}
}
