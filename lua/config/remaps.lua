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
vim.keymap.set("n", "<leader>rt", Reload_theme, { desc = "Reload theme", noremap = true, silent = true })

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
vim.keymap.set('n', '<space>se', vim.diagnostic.open_float, { desc = "Show Error" })
vim.keymap.set('n', 'grf', vim.lsp.buf.format, { desc = "Format current file" })
vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
