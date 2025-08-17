return {
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
}
