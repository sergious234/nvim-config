-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50"
-- vim.cmd("colorscheme tokyonight-storm")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.winborder = "rounded"

vim.opt.foldenable = false

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

vim.opt.termguicolors = true

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- vim.g.mapleader = " "

-- vim.g.indentLine_concealcursor = 'n'
vim.opt.foldmethod = "indent"

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
	virtual_text = {
		prefix = "",
		severity = nil,
	},
	signs = true,
	update_in_insert = true,
})

vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("x", "ia", ":<C-u>normal! T<vt><CR>", { silent = true })
			-- you can also put keymaps in here
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

vim.fn.sign_define("DiagnosticSignError", { text = "⑱", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "꩜", texthl = "DiagnosticSignWarn" })

vim.cmd("colorscheme " .. Theme.colorscheme)
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
