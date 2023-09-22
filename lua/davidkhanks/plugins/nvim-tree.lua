local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    print("nvim-tree not installed!!!")
    return
end

-- recommended to set these
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    filters = {
        git_ignored = true,
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { "^.git$" },
        exclude = { "local.py", ".devhome" },
    },
    git = {
        show_on_open_dirs = false,
    },
    actions = {
        open_file = {
            window_picker = {
                chars = "JKL1234567890"
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        severity = {
            min = vim.diagnostic.severity.ERROR,
            max = vim.diagnostic.severity.ERROR,
        },
    },

})

-- Custom keybindings for Spacemacs-like experience
-- Jump to tree
vim.keymap.set("n", "<leader>pt", function()
    vim.cmd("NvimTreeFocus")
end)

-- Close the tree
vim.keymap.set("n", "<leader>pq", function()
    vim.cmd("NvimTreeClose")
end)

-- Collapse the tree
vim.keymap.set("n", "<leader>ph", function()
    vim.cmd("NvimTreeCollapse")
end)

-- Collapse the tree except for where there are open buffers
vim.keymap.set("n", "<leader>pH", function()
    vim.cmd("NvimTreeCollapseKeepBuffers")
end)

-- Make the tree window bigger by 10
vim.keymap.set("n", "<leader>p]", function()
    vim.cmd("NvimTreeResize +10")
end)


-- Make the tree window smaller by 10
vim.keymap.set("n", "<leader>p[", function()
    vim.cmd("NvimTreeResize -10")
end)

-- Jump to tree and go to currently open buffer
vim.keymap.set("n", "<leader>ff", function()
    vim.cmd("NvimTreeFindFile")
end)

