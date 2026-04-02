vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>ku", ":noh<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>fe", ":Explore<CR>")


vim.keymap.set("n", "<leader>ww", ":write<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", ":quit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>so", ":so %<CR>", { desc = "Reload current file", noremap = true, silent = true })

-- Reload theme
-- vim.keymap.set("n", "<leader>rt", Reload_theme, { desc = "Reload theme", noremap = true, silent = true })

--[[
--  w+ -> window control
--      s,v -> horizontal/vertial split
--      k,j -> move up/down window
--      l,h -> move right/left window
--
--]]
vim.keymap.set("n", "<leader>ws", ":split<CR>")
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>wj", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>wk", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>wl", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>wh", ":wincmd h<CR>")
--vim.keymap.set("n", "<leader>ww", ":wincmd w<CR>")
--vim.keymap.set("n", "<leader>wp", ":wincmd p<CR>")


vim.keymap.set('n', '<leader>ff', ":Pick files<CR>")
vim.keymap.set('n', '<leader>hh', ":Pick help<CR>")
vim.keymap.set('n', '<leader>ee', ":Oil<CR>")

--[[
-- t+ -> buffer control
--  k,j -> last/first buffer
--  h,l -> prev/next  buffer
--  d   -> delete     buffer
--]]
vim.api.nvim_set_keymap("n", "<leader>tk", ":blast<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>tj", ":bfirst<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>th", ":bprev<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>tl", ":bnext<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>td", ":bdelete<enter>", { noremap = false })

-- ge -> Go End
vim.api.nvim_set_keymap("n", "<leader>ge", "g_", { noremap = false })


vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client.server_capabilities.semanticTokensProvider then
			client.server_capabilities.semanticTokensProvider = nil
		end

		vim.keymap.set("n", "<leader>ne", function()
			vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
		end)

		vim.keymap.set("n", "<leader>pe", function()
			vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR
			})
		end)

		vim.keymap.set("n", "<leader>nw", function()
			vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
		end)

		vim.keymap.set("n", "<leader>pw", function()
			vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN })
		end)

		vim.keymap.set("n", "<leader>ph", function()
			vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.HINT })
		end)

		vim.keymap.set("n", "<leader>nh", function()
			vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.HINT })
		end)

		--
		opts.desc = "Show diagnostic"
		vim.keymap.set('n', '<leader>se', vim.diagnostic.open_float, opts)

		opts.desc = "Format current buffer"
		vim.keymap.set('n', 'grf', vim.lsp.buf.format, opts)

		opts.desc = "Code actions"
		vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, opts)

		opts.desc = "Go to declaration"
		vim.keymap.set("n", "grd", vim.lsp.buf.declaration, opts)

		opts.desc = "Go to definition"
		vim.keymap.set("n", "grD", vim.lsp.buf.definition, opts)

		opts.desc = "Smart rename"
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)

		-- opts.desc = "Show buffer diagnostics"
		-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

		opts.desc = "Show documentation under cursor"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		-- opts.desc = "Restart LSP"
		-- vim.keymap.set("n", "grs", ":LspRestart<CR>", opts)

		-- Enable inlay hints if supported
		-- local client = vim.lsp.get_client_by_id(ev.data.client_id)
		-- local ft = vim.bo[ev.buf].filetype
		-- local path = vim.api.nvim_buf_get_name(ev.buf)
		-- local disable_inlay_hints = vim.tbl_contains({ "c", "cpp", "objc", "objcpp" }, ft)
		--     or path:match("%.h$")
		--     or path:match("%.hh$")
		--     or path:match("%.hpp$")
		--     or path:match("%.hxx$")
		--     or path:match("%.inl$")

		-- if client and client.server_capabilities.inlayHintProvider and not disable_inlay_hints then
		-- 	vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
		-- end
	end,
})
