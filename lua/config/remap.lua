vim.g.mapleader = " "
vim.keymap.set("n","<C-n>", function()
    vim.cmd("NvimTreeToggle")
    vim.cmd("set nu")
    vim.cmd("set rnu")
end)

-- Highlight off
vim.keymap.set("n", "<A-n>", "<Cmd>noh<CR>")

-- Window switching
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Backspace
vim.keymap.set("n", "<A-BS>", "db")
vim.keymap.set("i", "<A-BS>", "<C-w>")
vim.keymap.set("i", "<C-BS>", "<C-w>")

-- Save
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>")
vim.keymap.set("n", "<C-A-s>", "<Cmd>wa<CR>")
vim.keymap.set("i", "", "<Cmd>w<CR>")

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- Undo
-- vim.keymap.set("i", "", ":w<CR>")

-- Quit all
vim.keymap.set("n", "<A-q>", "<Cmd>qa!<CR>")
vim.keymap.set("n", "<A-w>", "<Cmd>wqa!<CR>")
