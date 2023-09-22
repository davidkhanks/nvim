local lspzero_status, lsp = pcall(require, "lsp-zero")
if not lspzero_status then
    print("lsp-zero not installed")
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    print("luasnip not installed")
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    print("lspkind not installed")
    return
end


lsp.preset("recommended")

lsp.ensure_installed({
	'eslint',
	'pylsp',
})




lsp.extend_cmp()
local cmp = require('cmp')
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "buffer" }, -- text within the current buffer
        { name = "luasnip" }, -- snippets
        { name = "path" }, -- file system paths
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "..."
        }),
    },
})

lsp.on_attach(function(client, bufnr)
 	local opts = {buffer = bufnr, remap = false}
	-- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	vim.keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_incoming_calls<CR>", opts)
	vim.keymap.set("n", "<leader>co", "<cmd>Telescope lsp_outgoing_calls<CR>", opts)
	vim.keymap.set("n", "<leader>fc", "<cmd>Telescope lsp_document_symbols symbols={\"class\",\"function\",\"method\"}<CR>", opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('lspconfig').pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {
                        'E128',
                        'E266',
                    },
                    maxLineLength = 180
                }
            }
        }
    }
}

lsp.setup()
