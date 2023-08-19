require('nvim_comment').setup()

vim.keymap.set("n", "", ":CommentToggle<CR>")
vim.keymap.set("x", "", ":CommentToggle<CR>")
