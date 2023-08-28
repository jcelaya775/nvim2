require("luasnip.loaders.from_vscode").load()
local luasnip = require("luasnip")
-- luasnip.snippets = require("luasnip-snippets").load_snippets()

vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })
