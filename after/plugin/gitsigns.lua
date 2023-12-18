require("gitsigns").setup()

vim.keymap.set("n", "<leader>gb", "<Cmd>Gitsigns blame_line<CR>")
vim.keymap.set("n", "<leader>gt", "<Cmd>Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>gd", "<Cmd>Gitsigns diffthis<CR>")
vim.keymap.set("n", "<leader>gr", "<Cmd>Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>gp", "<Cmd>Gitsigns preview_hunk_inline<CR>")
vim.keymap.set("n", "]g", "<Cmd>Gitsigns next_hunk<CR>")
vim.keymap.set("n", "[g", "<Cmd>Gitsigns prev_hunk<CR>")
