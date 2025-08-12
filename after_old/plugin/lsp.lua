-- https://lsp-zero.netlify.app/docs/reference/lua-api.html
local lsp = require("lsp-zero")

require('mason').setup({})



-- local cmp = require('cmp')
local lspkind = require('lspkind')

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

require('lspconfig').pylsp.setup({})
require('lspconfig').clangd.setup({})

-- cmp.setup({
--     sources = {
--         {name = 'nvim_lsp'}
--     },
-- 
--     snippet = {
--         expand = function(args)
--             vim.snippet.expand(args.body)
--         end,
--     },
-- 
--     formatting = {
--         format = lspkind.cmp_format({
--             maxwidth = 30,
--             show_labelDetails = true
--         }),
--     },
--     mapping = cmp.mapping.preset.insert({})
-- })


lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['rust_analyzer'] = {'rust'}
    }
})

lsp.extend_lspconfig({
    sign_text = { error = '⑱ ', warn = '꩜ ', info = 'I', hint = '' },
})

require('mason-lspconfig').setup_handlers {
    ['rust_analyzer'] = function() end,
}

lsp.setup()
