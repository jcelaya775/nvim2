vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>")

-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Window switch
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Backspace
vim.keymap.set("n", "<A-BS>", "db")
vim.keymap.set("n", "<C-Bs>", "db")
vim.keymap.set("n", "<C-del>", "dw")
vim.keymap.set("i", "<A-BS>", "<C-w>")
vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("i", "<C-del>", "<Esc>ldwi")
vim.keymap.set("n", "<BS>", "dh")

-- Save
vim.keymap.set("n", "<C-s>", "<Cmd>w!<CR>")
vim.keymap.set("n", "<C-A-s>", "<Cmd>wa!<CR>")
vim.keymap.set("i", "", "<Cmd>w!<CR>")

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- Center
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("v", "G", "Gzz")
vim.keymap.set("x", "G", "Gzz")
vim.keymap.set("n", "'a", "'azz")
vim.keymap.set("n", "'s", "'szz")
vim.keymap.set("n", "'d", "'dzz")
vim.keymap.set("n", "'f", "'fzz")
vim.keymap.set("n", "'q", "'qzz")
vim.keymap.set("n", "'w", "'wzz")
vim.keymap.set("n", "'e", "'ezz")
vim.keymap.set("n", "'r", "'rzz")
vim.keymap.set("n", "'z", "'zzz")
vim.keymap.set("n", "'x", "'xzz")
vim.keymap.set("n", "'c", "'czz")
vim.keymap.set("n", "'v", "'vzz")

-- Escape
vim.keymap.set("n", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")
vim.keymap.set("c", "<C-c>", "<Esc>")

-- Undo
vim.keymap.set("i", "", vim.cmd.u)
vim.keymap.set("n", "", vim.cmd.u)
vim.keymap.set("v", "", vim.cmd.u)
vim.keymap.set("x", "", vim.cmd.u)

-- Quit
vim.keymap.set("n", "<leader>q", "<Cmd>q!<CR>")

-- Quit all
vim.keymap.set("n", "<A-q>", "<Cmd>qa!<CR>")
vim.keymap.set("n", "<A-w>", "<Cmd>wqa!<CR>")
