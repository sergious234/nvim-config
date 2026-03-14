return {
	{
	"folke/tokyonight.nvim",
	opts = {
		transparent = false,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
},
	"https://github.com/vague2k/vague.nvim",
	{
		"sainnhe/gruvbox-material",
	},
	{
		"sainnhe/everforest",
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"rebelot/kanagawa.nvim",
	{
		"ribru17/bamboo.nvim", 
		config = function() 
			require('bamboo').setup()
			require('bamboo').load()
		end,
	}
}
