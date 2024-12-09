require("no-neck-pain").setup({
  width = 150,
  autocmds = {
    enableOnVimEnter = true,
  },
})

vim.keymap.set("n", "<leader>ce", "<cmd>NoNeckPain<CR>")
vim.keymap.set("n", "<leader>cs", "<cmd>NoNeckPainWidthDown<CR>")
vim.keymap.set("n", "<leader>cb", "<cmd>NoNeckPainWidthUp<CR>")
vim.keymap.set("n", "<leader>cr", ":NoNeckPainResize ")
