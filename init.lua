require("config.lazy")
require("config.options")
require("config.remaps")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*.rs', 'rs', '.rs', '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
