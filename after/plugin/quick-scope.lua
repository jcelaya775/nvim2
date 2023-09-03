vim.g.qs_buftype_blacklist = { "terminal", "nofile", "help" }

vim.keymap.set("n", "<leader>s", "<Cmd>QuickScopeToggle<CR>")
vim.keymap.set("x", "<leader>s", "<Cmd>QuickScopeToggle<CR>")
vim.keymap.set("v", "<leader>s", "<Cmd>QuickScopeToggle<CR>")
