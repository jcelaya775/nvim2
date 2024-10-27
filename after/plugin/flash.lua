require("flash").setup({
	modes = {
		char = {
			enabled = false,
		},
	},
})

vim.keymap.set({ "n", "v", "x" }, "<leader>;", function()
	require("flash").jump()
end)
vim.keymap.set({ "n", "v", "x" }, "<leader>/", function()
	require("flash").jump()
end)
vim.keymap.set({ "n", "v", "x" }, "<A-/>", function()
	require("flash").jump()
end)
