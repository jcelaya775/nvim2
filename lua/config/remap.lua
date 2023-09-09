vim.g.mapleader = " "

-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Previous buffer
vim.keymap.set("n", "pb", "<C-6>")

-- Stay in current position when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Window switch
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Backspace/delete
-- vim.keymap.set("n", "<C-h>", "db") -- <C-BS>
-- vim.keymap.set("i" "<C-h>", "<C-w>") -- <C-BS>
vim.keymap.set("n", "<BS>", "db")
vim.keymap.set("n", "<A-BS>", "db")
vim.keymap.set("n", "<A-BS>", "db")
vim.keymap.set("i", "<A-BS>", "<C-w>")
vim.keymap.set("n", "<C-del>", "dw")
vim.keymap.set("i", "<C-del>", "<Esc>ldwi")
vim.keymap.set("n", "<BS>", "dh")

-- Save
vim.keymap.set("n", "<C-s>", "<cmd>w!<CR>")
vim.keymap.set("v", "<C-s>", "<cmd>w!<CR>")
vim.keymap.set("x", "<C-s>", "<cmd>w!<CR>")
vim.keymap.set("i", "<C-s>", "<C-o><cmd>w!<CR>")
vim.keymap.set("n", "<C-A-s>", "<cmd>wa!<CR>")
vim.keymap.set("v", "<C-A-s>", "<cmd>wa!<CR>")
vim.keymap.set("x", "<C-A-s>", "<cmd>wa!<CR>")
vim.keymap.set("i", "<C-A-s>", "<cmd>wa!<CR>")

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
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

-- Paste without yanking
vim.keymap.set("x", "<leader>p", '"_dP')

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("x", "<leader>y", '"+y')

-- Escape
vim.keymap.set("n", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")
vim.keymap.set("c", "<C-c>", "<Esc>")
vim.keymap.set("s", "<C-c>", "<Esc>")

-- ??
vim.keymap.set("n", "Q", "<Nop>")

-- Undo
vim.keymap.set("i", "", vim.cmd.u)
vim.keymap.set("n", "", vim.cmd.u)
vim.keymap.set("v", "", vim.cmd.u)
vim.keymap.set("x", "", vim.cmd.u)

-- Quit
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>")

-- Quit all
vim.keymap.set("n", "<A-q>", "<cmd>qa!<CR>")
vim.keymap.set("n", "<A-w>", "<cmd>wqa!<CR>")

-- Quickfix list
-- vim.keymap.set("n", "<A-n>", "<cmd>cnext<CR>")
-- vim.keymap.set("n", "<A-p>", "<cmd>cprev<CR>")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>")

-- Global search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod +x this file
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true })

-- Buffer movement
vim.keymap.set("n", "<leader>bn", "<cmd>bn<CR>")

-- Work-around for <Tab> overriding <C-i>
vim.keymap.set("n", "<C-n>", "<Tab>")
vim.keymap.set("n", "<Tab>", "<C-n>")
