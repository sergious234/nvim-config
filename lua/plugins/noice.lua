return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	config = function()
		require("noice").setup({
			routes = {
				{
					filter = { event = "notify", find = "No information available" },
					opts = { skip = true },
				},
			},
			presets = {
				lsp_doc_border = true,
			},
		})
		vim.defer_fn(function()
			vim.notify("🎨 Tema aleatorio: " .. Theme.colorscheme, vim.log.levels.INFO)
		end, 100)
	end,
}
