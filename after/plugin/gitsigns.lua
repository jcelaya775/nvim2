require("gitsigns").setup({
	current_line_blame = true,
})

vim.keymap.set("n", "<leader>gb", "<Cmd>Gitsigns blame_line<CR>")
vim.keymap.set("n", "<leader>gd", "<Cmd>Gitsigns diffthis<CR>")