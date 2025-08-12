-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true
vim.opt.background = "dark"

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
	}

	math.randomseed(os.time())
	local i = math.random(#schemes)

	return schemes[i]
end

Theme = Random_theme()

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},

	--[[
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	"debugloop/telescope-undo.nvim",
	"nvim-tree/nvim-web-devicons",

	"lewis6991/gitsigns.nvim",

	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	"nanotee/zoxide.vim",
	"nvim-telescope/telescope-ui-select.nvim",
	"mfussenegger/nvim-jdtls",
	"mrcjkb/rustaceanvim",
	"mason-org/mason-registry",
	{ "echasnovski/mini.nvim", version = "*" },

	"nvimdev/indentmini.nvim",

	{ "numToStr/Comment.nvim", opts = {} },

	{
		"aaronhallaert/advanced-git-search.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-fugitive",
			"tpope/vim-rhubarb",
		},
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"exosyphon/telescope-color-picker.nvim",
		config = function()
			vim.keymap.set("n", "<leader>uC", "<cmd>Telescope colors<CR>", { desc = "Telescope Color Picker" })
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"ThePrimeagen/harpoon",
			"nvim-lua/plenary.nvim",
			"joshmedeski/telescope-smart-goto.nvim",
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
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

			-- Autocompletion
			-- { "hrsh7th/nvim-cmp" }, -- Required
			-- { "hrsh7th/cmp-nvim-lsp" }, -- Required
			-- { "hrsh7th/cmp-buffer" },
			-- { "hrsh7th/cmp-path" },
			-- { "hrsh7th/cmp-cmdline" },
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" },
			{ "onsails/lspkind.nvim" },
			-- { "saadparwaiz1/cmp_luasnip" },
		},
	},
	]]
	--
	install = { colorscheme = { "habamax", "tokyonight-night" } },
})

require("config.options")
require("config.remaps")
