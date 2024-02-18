vim.opt.termguicolors = true
require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        separator = true,
        text_align = "left",
      },
    },
    close_command = function(bufnum)
      require("bufdelete").bufdelete(bufnum, true)
    end,
    sort_by = "relative",
  },
})

-- Cycling
vim.keymap.set("n", "<S-A-h>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<S-A-l>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-A-h>", "<cmd>BufferLineMovePrev<CR>")
vim.keymap.set("n", "<C-A-l>", "<cmd>BufferLineMoveNext<CR>")
vim.keymap.set("n", "<S-A-k>", "<cmd>BufferLinePick<CR>")

-- Go to nth buffer
local set_keymap = vim.api.nvim_set_keymap
set_keymap("n", "<M-1>", "<CMD>lua require'bufferline'.go_to_buffer(1)<CR>", {})
set_keymap("n", "<M-2>", "<CMD>lua require'bufferline'.go_to_buffer(2)<CR>", {})
set_keymap("n", "<M-3>", "<CMD>lua require'bufferline'.go_to_buffer(3)<CR>", {})
set_keymap("n", "<M-4>", "<CMD>lua require'bufferline'.go_to_buffer(4)<CR>", {})
set_keymap("n", "<M-5>", "<CMD>lua require'bufferline'.go_to_buffer(5)<CR>", {})
set_keymap("n", "<M-6>", "<CMD>lua require'bufferline'.go_to_buffer(6)<CR>", {})
set_keymap("n", "<M-7>", "<CMD>lua require'bufferline'.go_to_buffer(7)<CR>", {})
set_keymap("n", "<M-8>", "<CMD>lua require'bufferline'.go_to_buffer(8)<CR>", {})
set_keymap("n", "<M-9>", "<CMD>lua require'bufferline'.go_to_buffer(9)<CR>", {})
set_keymap("n", "<M-0>", "<CMD>lua require'bufferline'.go_to_buffer(10)<CR>", {})
