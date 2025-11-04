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
	--[[
	config = function()
		require 'oil'.setup({
			default_file_explorer = true,
			lsp_file_methods = {
				-- Enable or disable LSP file operations
				enabled = true,
				-- Time to wait for LSP file operations to complete before skipping
				timeout_ms = 100,
				-- Set to true to autosave buffers that are updated with LSP willRenameFiles
				-- Set to "unmodified" to only save unmodified buffers
				autosave_changes = false,
			},
			view_options = {
				is_always_hidden = function(name, _)
					return name == "target" or name == ".git"
				end
			},

			columns = {
				"icon",
				-- "permissions",
				"size",
				-- "mtime",
			},
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = { "actions.close", mode = "n" },
				["<C-l>"] = "actions.refresh",
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
		})
	end,
	dependencies = {
		{ 'echasnovski/mini.nvim',       version = '*' },
		{ "nvim-tree/nvim-web-devicons", opts = {} },
		{
			"benomahony/oil-git.nvim",
			dependencies = { "stevearc/oil.nvim" },
			-- No opts or config needed! Works automatically
		}
	},
	lazy = false,
	--]]
	,
	dependencies = {
		{ 'echasnovski/mini.nvim',       version = '*' },
		{ "nvim-tree/nvim-web-devicons", opts = {} }
	}

}
