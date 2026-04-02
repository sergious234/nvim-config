-- This file configures oil.nvim, a file explorer that treats directories like buffers.
-- Allows editing the filesystem as if it were a text file.
-- Dependencies: mini.nvim (icons), nvim-web-devicons (file icons)
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
