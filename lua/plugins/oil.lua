return {
	"stevearc/oil.nvim",
	config = function()
		require 'oil'.setup({
			columns = {
				"icon",
				-- "permissions",
				"size",
				-- "mtime",
			},
		})
	end
	,
	dependencies = {
		{ 'nvim-mini/mini.nvim',       version = '*' },
		{ "nvim-tree/nvim-web-devicons", opts = {} }
	}
}
