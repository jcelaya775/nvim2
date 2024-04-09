require("outline").setup({
	outline_window = {
		show_numbers = true,
		show_relative_numbers = true,
	},
})

vim.keymap.set("n", "<leader>sy", "<cmd>Outline<cr>")
