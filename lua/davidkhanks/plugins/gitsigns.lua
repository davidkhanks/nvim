local gitsigns_status, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status then
    print("gitsigns not installed")
    return
end

gitsigns.setup()

vim.keymap.set("n", "<leader>gb", function()
    vim.cmd("Gitsigns toggle_current_line_blame")
end)

