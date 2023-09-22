local mark_status, mark = pcall(require, "harpoon.mark")
if not mark_status then
    print("harpoon marks not installed")
    return
end

local ui_status, ui = pcall(require, "harpoon.ui")
if not ui_status then
    print("harpoon ui not installed")
    return
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>bb", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>jj", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>kk", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>ll", function() ui.nav_file(4) end)

