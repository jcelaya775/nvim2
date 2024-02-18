vim.g.mapleader = " "

-- Move
vim.keymap.set("v", "<C-A-j>", "hello")
vim.keymap.set("v", "<C-A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Moving between buffers
vim.keymap.set("n", "<C-A-o>", ":bprev<CR>")
vim.keymap.set("n", "<C-A-i>", ":bnext<CR>")

-- Close buffers
local function close_current_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(bufnr, { force = true })

  local tree = require("nvim-tree.api").tree
  if tree.is_visible() then
    vim.api.nvim_command("NvimTreeClose")
    vim.api.nvim_command("NvimTreeOpen")
    vim.api.nvim_command("wincmd p") -- mave to previous window
  end
end
vim.keymap.set("n", "<leader>x", close_current_buffer)

-- Stay in current position when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- -- Window switch
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Backspace/delete
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
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-u>", "<C-u>M")
vim.keymap.set("n", "<C-d>", "<C-d>M")
vim.keymap.set("n", "<C-f>", "<C-f>M")
vim.keymap.set("n", "<C-b>", "<C-b>M")
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
vim.keymap.set("n", "%", "%zz")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("x", "<leader>y", '"+y')
-- vim.keymap.set("n", "<leader>d", '"+d')
-- vim.keymap.set("v", "<leader>d", '"+d')
-- vim.keymap.set("x", "<leader>d", '"+d')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("x", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>P", '"+P')
vim.keymap.set("x", "<leader>P", '"+P')

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
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod +x this file
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true })

-- Help menu
vim.keymap.set("n", "<leader>h", ":vert h ")

-- Reset workspace
vim.keymap.set("n", "<leader>R", function()
  vim.api.nvim_command("BufferLineCloseLeft")
  vim.api.nvim_command("BufferLineCloseRight")
  close_current_buffer()

  for harpoon_file_index = 1, 8 do
    Open_harpoon_file(harpoon_file_index)
  end
end)
