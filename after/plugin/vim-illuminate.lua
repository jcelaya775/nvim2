local illuminate = require("illuminate")

vim.keymap.set({ "n", "v", "x" }, "<A-n>", function()
	illuminate.goto_next_reference()
end)
vim.keymap.set({ "n", "v", "x" }, "<A-p>", function()
	illuminate.goto_prev_reference()
end)
