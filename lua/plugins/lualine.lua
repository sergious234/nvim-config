return {
	"nvim-lualine/lualine.nvim", -- Fancier statusline

	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine.themes.gruvbox")
		require("lualine.themes.ayu_mirage")
        require("lualine.themes.everforest")
        require("lualine.themes.dracula")
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = Theme.lualine,
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					{
						"buffers",
						show_modified_status = true,
						mode = 0,
						symbols = {
							modified = " ●", -- Text to show when the buffer is modified
							alternate_file = "#", -- Text to show to identify the alternate file
							directory = "", -- Text to show when the buffer is a directory
						},
					},
				},
				lualine_c = {
					{
						"diagnostics",

						-- Table of diagnostic sources, available sources are:
						--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
						-- or a function that returns a table as such:
						--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
						sources = { "nvim_diagnostic", "nvim_lsp" },

						-- Displays diagnostics for the defined severity types
						sections = { "error", "warn", "info", "hint" },

						diagnostics_color = {
							-- Same values as the general color option can be used here.
							error = "DiagnosticError", -- Changes diagnostics' error color.
							warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
							info = "DiagnosticInfo", -- Changes diagnostics' info color.
							hint = "DignosticHint", -- Changes diagnostics' hint color.
						},
						symbols = { error = "⑱ ", warn = "꩜ ", info = "I", hint = "" },
						colored = true, -- Displays diagnostics status in color if set to true.
						update_in_insert = false, -- Update diagnostics in insert mode.
						always_visible = false, -- Show diagnostics even if there are none.
					},
				},
				lualine_x = { "diff", "encoding", "filesize", "filetype" },
			},
		})
	end,
}
