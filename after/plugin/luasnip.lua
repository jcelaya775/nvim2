require("luasnip.loaders.from_vscode").load()

local luasnip = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	luasnip.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-h>", function()
	luasnip.jump(-1)
end, { silent = true })
