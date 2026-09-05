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

-- Force treesitter folding for Rust
vim.opt.foldmethod = "syntax"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- Keep folds open by default when opening a file
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "1"
-- Folding customization
vim.opt.fillchars = {
  fold = " ",       -- Replace default dashes with blank spaces
  foldopen = "",   -- Icon for an open fold (requires a Nerd Font)
  foldclose = "",  -- Icon for a closed fold
  foldsep = "│",    -- Line connecting folds
}

vim.lsp.inlay_hint.enable(true)
vim.lsp.buf.format({ async = true })
vim.diagnostic.config({ virtual_text = true })
vim.g.background_color = "dark"

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
require "mini.statusline".setup({
	content = {
		active = function()
			-- 1. Grab all the default mini.statusline sections
			local mode, mode_hl               = MiniStatusline.section_mode({ trunc_width = 120 })
			local git                         = MiniStatusline.section_git({ trunc_width = 40 })
			local diff                        = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics                 = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp                         = MiniStatusline.section_lsp({ trunc_width = 75 })
			local filename                    = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo                    = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location                    = MiniStatusline.section_location({ trunc_width = 75 })
			local search                      = MiniStatusline.section_searchcount({ trunc_width = 75 })

			-- 2. Fetch the battery status safely
			local battery                     = ""
			local has_battery, battery_plugin = pcall(require, "battery")
			if has_battery then
				battery = battery_plugin.get_status_line()
			end

			-- 3. Construct the layout
			return MiniStatusline.combine_groups({
				{ hl = mode_hl,                 strings = { mode } },
				{ hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
				'%<',                                                 -- Truncate point if the window gets too small
				{ hl = 'MiniStatuslineFilename', strings = { filename } },
				'%=',                                                 -- Pushes everything below this to the right side
				{ hl = 'MiniStatuslineFileinfo', strings = { battery } }, -- The custom battery section
				{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
				{ hl = mode_hl,                  strings = { search, location } },
			})
		end,
	}
})


vim.lsp.config("lua_ls", {
	settings = {
		Lua = {

			runtime = {
				version = "luaJIT",
				path = vim.split(package.path, ";")
			},
			diagnostics = {
				globals = { "vim" }
			},
			workspace = {
				library = { vim.env.VIMRUNTIME },
				checkThirdParty = true
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
		fallbackFlags = { '-Wall', '-Wextra' }
	},
})

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

vim.lsp.config["ruff"] = {
	cmd = { "uv", "run", "ruff", "server" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
	settings = {
		pyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				ignore = { '*' },
			},
		},
	},
}

vim.lsp.config["pyright"] = {}

vim.lsp.enable({ "lua_ls", "tinymist", "tsserver", "clangd", "ruff", "pyright" })

-- vim.treesitter.language.add('python', { path = '/usr/lib/tree_sitter/python.so' })

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

			vim.keymap.set("n", "grR", function() vim.cmd.RustLsp('run') end, { desc = "run" })
			-- vim.keymap.set("n", "grr", function() vim.cmd.RustLsp('') end, { desc = "run" })
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
				-- cargo = {
				-- 	features = {"serde"}
				-- },
				inlayHints = {
					enable = true,
					renderColons = true,
					parameterHints = {
						enable = true,
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

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown' },
  callback = function() vim.treesitter.start() end,
})
