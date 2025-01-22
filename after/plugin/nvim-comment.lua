require("nvim_comment").setup()

vim.keymap.set({ "n", "v", "x" }, "", ":CommentToggle<CR>")
vim.keymap.set("i", "", "<Cmd>CommentToggle<CR>")
vim.keymap.set({ "n", "v", "x" }, "<A-/>", ":CommentToggle<CR>")
vim.keymap.set("i", "<A-/>", "<Cmd>CommentToggle<CR>")
