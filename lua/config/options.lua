vim.opt.winborder = "rounded"
vim.opt.hlsearch = false
vim.opt.tabstop = 2
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.foldmethod = "indent"
vim.lsp.inlay_hint.enable(true)


require "mason".setup()
require "showkeys".setup({ position = "top-right" })
require "mini.pick".setup({
	window = {
		config = {
			border = 'rounded',
		}
	}
})

function _G.get_oil_winbar()
	local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
	local dir = require("oil").get_current_dir(bufnr)
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

require "oil".setup({
	columns = {
		"icon",
		-- "permissions",
		"size",
		-- "mtime",
	},
	preview_win = {
		-- Whether the preview window is automatically updated when the cursor is moved
		update_on_cursor_moved = true,
		-- How to open the preview window "load"|"scratch"|"fast_scratch"
		preview_method = "fast_scratch",
		-- A function that returns true to disable preview on a file e.g. to avoid lag
		disable_preview = function(filename)
			return false
		end,
		-- Window-local options to use for preview window buffers
		win_options = {},
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
	win_options = {
		winbar = "%!v:lua.get_oil_winbar()",
	},
})

vim.lsp.enable({ "lua_ls", "tinymist", "clangd" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})

require('nvim-treesitter.configs').setup({
	highlight = { enable = true, },
	ensure_installed = { "c", "lua", "rust", "python", "java", "cpp", "regex" },
})


-- vim.cmd [[set completeopt+=menuone,noselect,popup]]

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.winborder = "rounded"
-- vim.opt.swapfile = false
-- vim.opt.undofile = true
-- vim.opt.number = true
-- vim.opt.relativenumber = true
-- vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")


-- vim.g.mapleader = " "

-- vim.g.indentLine_concealcursor = 'n'

-- vim.diagnostic.config({
--     virtual_text = {
--         prefix = "",
--         severity = nil,
--     },
--     signs = true,
--     update_in_insert = true,
-- })


-- vim.fn.sign_define("DiagnosticSignError", { text = "⑱", texthl = "DiagnosticSignError" })
-- vim.fn.sign_define("DiagnosticSignWarn", { text = "꩜", texthl = "DiagnosticSignWarn" })


-- local lsp_config = require('lspconfig')
-- lsp_config.clangd.setup({
--     on_attach = function(client, bufnr)
--         vim.lsp.codelens.refresh()
--     end
-- })

-- vim.g.rustaceanvim = {
--     server = {
--         cmd = function()
--             local mason_registry = require('mason-registry')
--             local ra_binary = mason_registry.is_installed('rust-analyzer')
--             -- This may need to be tweaked, depending on the operating system.
--             and mason_registry.get_package('rust-analyzer'):get_install_path() .. "/rust-analyzer"
--             or "rust-analyzer"
--             return { ra_binary } -- You can add args to the list, such as '--log-file'
--         end,
--
--         default_settings = {
--             ["rust-analyzer"] = {
--                 checkOnSave = true,
--                 check = {
--                     command = "clippy"
--                 }
--             }
--         }
--     }
-- }


math.randomseed(os.time())
function Random_theme()
	local schemes = {
		{
			lualine = "gruvbox-material",
			colorscheme = "gruvbox-material",
		},

		{
			lualine = "dracula",
			colorscheme = "tokyonight-storm",
		},
		{
			lualine = "everforest",
			colorscheme = "everforest",
		},

		{
			lualine = "ayu_mirage",
			colorscheme = "catppuccin-mocha",
		},
		{
			lualine = "vague",
			colorscheme = "vague",
		}
	}

	local i = math.random(#schemes)
	return schemes[i]
end

-- Reload theme
function Reload_theme()
	local theme = Random_theme().colorscheme
	vim.cmd("colorscheme " .. theme)
	vim.notify("New theme: " .. theme .. " !", vim.log.levels.INFO)
end

Theme = Random_theme()
vim.cmd("colorscheme " .. Theme.colorscheme)

vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)
			vim.notify("rustaceanvim attached!")
			vim.keymap.set("n", "grd", vim.lsp.buf.definition)
			vim.keymap.set("x", "ia", ":<C-u>normal! T<vt><CR>", { silent = true })
			-- you can also put keymaps in here
			vim.keymap.set(
				"n",
				"K",
				function()
					vim.cmd.RustLsp({ 'hover', 'actions' })
				end,
				{ silent = true, buffer = bufnr }
			)
		end,

		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				inlayHints = {
					enable = true,
					renderColons = true,
					parameterHints = {
						enable = false,
					},
					typeHints = {
						enable = true,
					},
				},
			},
		},
	},
	-- DAP configuration
	dap = {},
}
