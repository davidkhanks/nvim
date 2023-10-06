vim.g.mapleader = " "
-- File Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Window Commands
vim.keymap.set("n", "<leader>wv", "<C-W><C-v>") -- Split vertically
vim.keymap.set("n", "<leader>ws", "<C-W><C-s>") -- Split horizontally
vim.keymap.set("n", "<leader>wh", "<C-W><C-h>") -- Move to window left
vim.keymap.set("n", "<leader>wl", "<C-W><C-l>") -- Move to window riqht
vim.keymap.set("n", "<leader>wj", "<C-W><C-J>") -- Move to window down
vim.keymap.set("n", "<C-j>", "<C-W><C-J>") -- Move to window down
vim.keymap.set("n", "<leader>wk", "<C-W><C-K>") -- Move to window up
vim.keymap.set("n", "<leader>wd", "<C-W>q") -- Close window

vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Buffer commands
vim.keymap.set('n', '<leader>bd', ':bp|sp|bn|bd<CR>') -- save this buffer then, kill all other buffers
vim.keymap.set('n', '<leader>bD', ':w|%bd|e#<CR>') -- save this buffer then, kill all other buffers
vim.keymap.set('n', '<leader>QQ', ':w|%bd|e#<CR>:q!') -- save this buffer then, kill all other buffers

-- File commands
vim.keymap.set('n', '<leader>fs', ':write<CR>')

-- Movement commands
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

-- Paste and send replaced data to void buffer
vim.keymap.set("x", "<leader>p", "\"_dp")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- Delete to system clipboard
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Kill Q because it sucks
vim.keymap.set("n", "Q", "<nop>")

-- Start a new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace all instances of current word
vim.keymap.set("n", "<leader>ew", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set current file to be executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Source "shout out"
vim.keymap.set("n", "<leader>so", function()
    vim.cmd("so")
end)

-- Go to last buffer
vim.keymap.set("n", "<leader><Tab>", function()
    vim.cmd("edit #")
end)


-- telescope
vim.keymap.set('n', '<leader>pf', "<cmd>Telescope find_files<CR>")
vim.keymap.set('n', '<leader>sp', "<cmd>Telescope live_grep<CR>")
vim.keymap.set('n', '<leader>ss', "<cmd>Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>")
vim.keymap.set('n', '<C-p>', "<cmd>Telescope git_files<CR>")
vim.keymap.set('n', '<leader>ggb', "<cmd>Telescope git_branches<CR>")
vim.keymap.set('n', '<leader>ggs', "<cmd>Telescope git_status<CR>")

