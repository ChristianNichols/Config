require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "asm_lsp",
    }
})

local on_attach = function(_, _)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded"}),
}

require('lspconfig').lua_ls.setup({
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

vim.api.nvim_set_hl(0, 'NormalFloat', {
    link = 'Normal',
})
vim.api.nvim_set_hl(0, 'FloatBorder', {
    bg = 'none',
})

local cmp = require("cmp")

cmp.setup {
  sources = {
        { name = 'buffer',
            option = {
                get_bufnrs = function()
                return vim.api.nvim_list_bufs()
                end
            }
        },

        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}

require("luasnip.loaders.from_vscode").lazy_load()


require("lspconfig").clangd.setup{
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").pyright.setup{
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").asm_lsp.setup{
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
}
