require('nvim_comment').setup()

vim.keymap.set({"n", "v", "x"}, "", "<Cmd>CommentToggle<CR>")
vim.keymap.set("i", "", "<Cmd>CommentToggle<CR>")
