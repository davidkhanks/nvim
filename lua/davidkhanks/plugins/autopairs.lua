local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
    print("nvim-autopairs not installed")
    return
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in js template_strings
        java = false, -- don't check treesitter on java
    },
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
    print("nvim-autopairs.completion.cmp not found during autopairs setup")
    return
end

-- import nvim-cmp plugin safely
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
    print("cmp not found during autopairs setup")
    return
end

-- make autopairs and completion work toegether
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
