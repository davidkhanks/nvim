local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    print("cmp not installed")
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

-- load friendly-snippets
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
        ["<C-p>"] = cmp.mapping.scroll_docs(-4),
        ["<C-n>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
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
