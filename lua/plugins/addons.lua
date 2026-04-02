-- This file configures supplementary plugins:
--  - nvim-lspconfig:  LSP server configuration and attachment
--  - mason.nvim:      LSP server, linter, and formatter package manager
--  - LuaSnip:         Snippet engine for code completion
--  - showkeys:        Displays recent keypresses on screen
--  - which-key.nvim:  Popup showing available keybindings
--  - fidget.nvim:     Progress UI for LSP operations
--  - uv.nvim:         Python uv package manager integration
return {
	{
		'https://github.com/neovim/nvim-lspconfig',
	},
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/L3MON4D3/LuaSnip",

	{ 'https://github.com/NvChad/showkeys',                 opt = true },
	"folke/which-key.nvim",

	-- LSP loading bar
	{
		"j-hui/fidget.nvim",
		opts = {
		},
	},

	-- Python
	{
		"benomahony/uv.nvim",
  	-- Optional filetype to lazy load when you open a python file
  	-- ft = { python }
  	-- Optional dependency, but recommended:
  	-- dependencies = {
  	--   "folke/snacks.nvim"
  	-- or
  	--   "nvim-telescope/telescope.nvim"
  	-- },
  	opts = {
  	  picker_integration = true,
  	},
	}
}
