vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>kf", ":Neoformat<CR>")

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>ku", ":noh<CR>")
vim.keymap.set("n" ,"<C-d>", "<C-d>zz")
vim.keymap.set("n" ,"<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>ff", ":Explore<CR>")


vim.keymap.set("n", "<leader>ws", ":split<CR>")
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>wj", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>wk", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>wl", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>wh", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>ww", ":wincmd w<CR>")
vim.keymap.set("n", "<leader>wp", ":wincmd p<CR>")


vim.api.nvim_set_keymap("n", "<leader>tk", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>tj", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>th", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>tl", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>td", ":bdelete<enter>", {noremap=false})

vim.keymap.set("n", "<leader>ne", function()
    vim.diagnostic.goto_next({severity=vim.diagnostic.severity.ERROR})
end )

vim.keymap.set("n", "<leader>pe", function()
    vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.ERROR})
end )

vim.keymap.set("n", "<leader>nw", function()
    vim.diagnostic.goto_next({severity=vim.diagnostic.severity.WARN})
end )

vim.keymap.set("n", "<leader>pw", function()
    vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.WARN})
end )


vim.api.nvim_set_keymap('n', '<leader>nh', '<cmd>lua vim.diagnostic.goto_next{severity= vim.diagnostic.severity.HINT}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ph', '<cmd>lua vim.diagnostic.goto_prev{severity= vim.diagnostic.severity.HINT}<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<space>se', vim.diagnostic.open_float)
