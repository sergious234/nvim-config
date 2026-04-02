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
vim.lsp.buf.format({ async = true })
vim.diagnostic.config({ virtual_text = true })

require "mason".setup()
require "showkeys".setup({ position = "top-right" })
require "mini.pick".setup({
	window = {
		config = {
			border = 'rounded',
		}
	}
})
require "mini.icons".setup()
require "mini.diff".setup({
	view = {
		style = 'sign',
		signs = { change = '#', delete = '~', add = '+' }
	}
}
)
require "mini.git".setup()
require "mini.statusline".setup()

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})

vim.lsp.config("tsserver", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=never",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },

	root_markers = {
		'.clang-tidy'
	},
	capabilities = {
		declaration = {
			linkSupport = true
		},
		definition = {
			linkSupport = true
		},
	},
	init_options = {
		clangdFileStatus = true,
		completeUnimported = true,
		fallbackFlags = { '--std=c++23', '-Wall', '-Wextra' }
	},
})

vim.lsp.config["pylsp"] = {
	-- cmd = { "uv", "run", "pylsp" },
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_dir = vim.fs.root(0, { ".git", "pyproject.toml", "requirements.txt" }),

	settings = {
		pylsp = {
			plugins = {
				-- Enable linting
				pyflakes = { enabled = true },
				pycodestyle = { enabled = true },

				-- Formatting (gives code actions like "format document")
				autopep8 = { enabled = true },

				-- Refactoring / code actions
				rope = { enabled = true },

				-- Optional but useful
				-- mccabe = { enabled = true },
				yapf = { enabled = false }, -- avoid conflict with autopep8
				flake8 = { enabled = false }, -- disable if using pycodestyle
			},
		},
	},
}

vim.lsp.config["tinymist"] = {
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onSave",
		lint = {
			when = "onSave"
		},
		preview = {
			refresh = "onSave"
		}
	}
}

vim.lsp.enable({ "lua_ls", "tinymist", "tsserver", "pylsp", "clangd" })

vim.cmd("colorscheme gruvbox-material")

vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		on_attach = function(_, bufnr)
			vim.notify("rustaceanvim attached!")
			local opts = { buffer = bufnr, silent = true }


			vim.keymap.set("x", "ia", ":<C-u>normal! T<vt><CR>", { silent = true })
			-- vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "Goto definition" })
			vim.keymap.set("n", "grt", function() vim.cmd.RustLsp('openCargo') end,
				{ desc = "Open Cargo.toml", noremap = true })

			opts.desc = "Open docs.rs"
			vim.keymap.set("n", "grm", function() vim.cmd.RustLsp('openDocs') end, opts)
			vim.keymap.set("n", "gre", function() vim.cmd.RustLsp('explainError') end, { desc = "Explain error >.<" }) -- default to 'cycle'

			vim.keymap.set("n", "grc", function() vim.cmd.RustLsp('flyCheck', 'run') end, { desc = "check" })

			vim.keymap.set("n", "grr", function() vim.cmd.RustLsp('run') end, { desc = "run" })
			-- you can also put keymaps in here
			-- vim.keymap.set("n", "K", function() vim.cmd.RustLsp({ 'hover', 'actions' }) end,
			-- 	{ silent = true, buffer = bufnr, desc = "Show info" })
		end,

		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				checkOnSave = true,
				procMacro = {
					enable = true,
				},
				inlayHints = {
					enable = true,
					renderColons = true,
					parameterHints = {
						enable = false,
					},
					typeHints = {
						enable = true,
					},
					chainingHints = { enable = true }
				},
				check = {
					command = "clippy",
					extraArgs = { "--", "-Wclippy::all", "-Wclippy::correctness" }
				},
				lens = {
					enable = true,
					references = {
						method = {
							enable = true
						}
					}
				}
			},
		},
	},
	-- DAP configuration
	dap = {},
}

require "nvim-treesitter".setup({
	highlight = {
		enable = true,
	},
	auto_install = true,
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	-- autotag = {
	-- 	enable = true,
	-- },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"markdown",
		"markdown_inline",
		"bash",
		"lua",
		"dockerfile",
		"gitignore",
		"c",
		"rust",
		"python",
		"toml"
	},
})
