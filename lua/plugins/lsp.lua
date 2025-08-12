return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				rust_analyzer = function()
					return true
				end,
			},
		},
		{ -- Optional
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" },
		{ "onsails/lspkind.nvim" },
		-- { "saadparwaiz1/cmp_luasnip" },
	},

	config = function()
		local lsp = require("lsp-zero")

		require("mason").setup({})

		-- local cmp = require('cmp')
		local lspkind = require("lspkind")

		-- Fix Undefined global 'vim'
		lsp.configure("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		require("lspconfig").pylsp.setup({})
		require("lspconfig").clangd.setup({})
	end,
}
