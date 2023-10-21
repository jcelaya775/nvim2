vim.g.mapleader = " "

-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- TODO: Reorder buffers in MRU (most recently used) when opened
-- Use this relative buffer list for <C-A-o> and <C-A-i> as well
-- But, <C-A-o> and <C-A-i> should not change the order of the MRU list
-- Idea: Use :ls to get the buffer list and then use :bdelete to delete the buffer

local mru_buffers = {}
local buffer_list = vim.fn.getbufinfo({ buflisted = 1 })

for _, buffer in ipairs(buffer_list) do
  table.insert(mru_buffers, {
    name = buffer.name,
    id = buffer.bufnr,
    listed = buffer.listed,
  })
end

-- Move the element located n positions away from end of the list to the end of the list
local pop_back = function(list, n)
  local element = list[#list - n]
  table.remove(list, #list - n)
  table.insert(list, element)
end

local print_list = function(list)
  for _, item in ipairs(list) do
    print(item.name)
  end
end

print_list(mru_buffers)

-- NOTE: Can I create a vim plugin for this functionality?
-- OR: I should see if I can just use telescope's buffer mru list instead

-- Jump to previous nth buffer
-- TODO: Create a buffer access function that cycles back to start if n is greater than the length of the list
vim.keymap.set("n", "<C-A-j>", function()
  -- TODO: Eventually, buffer list will be maintained elsewhere through event listeners
  -- so, only these lines are needed
  -- local buffer = buffers[#buffers - 1]
  -- vim.cmd(":buffer " .. buffer.id)

  local buffer = mru_buffers[#mru_buffers - 1]
  vim.cmd(":buffer " .. buffer.id)
  print(":buffer " .. buffer.name)
  pop_back(mru_buffers, 1)
end)
vim.keymap.set("n", "<C-A-k>", function()
  local buffer = mru_buffers[#mru_buffers - 2]
  vim.cmd(":buffer " .. buffer.id)
  print(":buffer " .. buffer.name)
  pop_back(mru_buffers, 2)
end)
vim.keymap.set("n", "<C-A-l>", function()
  local buffer = mru_buffers[#mru_buffers - 3]
  vim.cmd(":buffer " .. buffer.id)
  print(":buffer " .. buffer.name)
  pop_back(mru_buffers, 3)
end)
vim.keymap.set("n", "<C-A-;>", function()
  local buffer = mru_buffers[#mru_buffers - 4]
  vim.cmd(":buffer " .. buffer.id)
  print(":buffer " .. buffer.name)
  pop_back(mru_buffers, 4)
end)

-- Cycle through buffers
-- TODO: Do not cycle past beginning or end of list
-- May need a special case for when jumping to a mru buffer after cycling
--  - Handle this mru case differently
--    - Instead of: pop_back(1), pop_back(2), etc.
--    - DO: pop_back(curr_pos); pop_back(1)
-- This way, we switch back to the original mru buffer while being able to switch back to the buffer that we switched from
local cycle = function(list, n)
  local element = list[#list - n]
  table.remove(list, #list - n)
  table.insert(list, 1, element)
end
local buffer_idx = 1 -- TODO: Update this index when buffers are opened/closed
-- if existing buffer is closed, update idx to previously opened buffer
-- if new buffer is opened, update idx to new buffer
vim.keymap.set("n", "<C-A-o>", ":bprevious<CR>")
vim.keymap.set("n", "<C-A-i>", ":bnext<CR>")

-- TODO: Set event listeners to update buffer list upon closing/opening buffers
-- New buffer event: Telescope, nvim-tree, etc. (or autocmd -> BufNewFile?)
--   - Add buffer to list
-- Open buffer event: autocmd BufEnter
--   - Move buffer to end of list
-- Delete event: <C-x> or <C-d> (or autocmd -> BufDelete?)
--   - Remove buffer from list
-- NOTE: Look out for [No Name] buffers
-- For current testing, source this file everytime buffers are opened/closed

-- Close buffers
local function close_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(bufnr, { force = true })

  local tree = require("nvim-tree.api").tree
  if tree.is_visible() then
    vim.api.nvim_command("NvimTreeClose")
    vim.api.nvim_command("NvimTreeOpen")
    vim.api.nvim_command("wincmd p") -- mave to previous window
  end
end
vim.keymap.set("n", "<leader>x", close_buffer)

-- Stay in current position when joining lines
vim.keymap.set("n", "J", "mzJ`z")

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

-- Paste without yanking
vim.keymap.set("x", "<leader>p", '"_dP')

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("x", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>d", '"+d')
vim.keymap.set("v", "<leader>d", '"+d')
vim.keymap.set("x", "<leader>d", '"+d')
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
