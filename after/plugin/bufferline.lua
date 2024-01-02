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

vim.keymap.set("n", "<S-A-h>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<S-A-l>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-A-h>", "<cmd>BufferLineMovePrev<CR>")
vim.keymap.set("n", "<C-A-l>", "<cmd>BufferLineMoveNext<CR>")
vim.keymap.set("n", "<S-A-k>", "<cmd>BufferLinePick<CR>")
