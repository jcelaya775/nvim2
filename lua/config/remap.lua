vim.g.mapleader = " "
vim.keymap.set("n","<C-n>", function()
    vim.cmd("NvimTreeToggle")
    vim.cmd("set nu")
    vim.cmd("set rnu")
end)

-- Highlight off
vim.keymap.set("n", "<A-u>", "<Cmd>noh<CR>")

-- Window switching
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Save
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>")

-- Quit all
vim.keymap.set("n", "<A-q>", "<Cmd>qa!<CR>")
vim.keymap.set("n", "<A-w>", "<Cmd>wqa!<CR>")
