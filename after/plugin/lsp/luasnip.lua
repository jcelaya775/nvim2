require("luasnip.loaders.from_vscode").load()

local luasnip = require("luasnip")
local cmp = require("cmp")
local copilot_suggestion = require("copilot.suggestion")

vim.keymap.set({ "s" }, "<Tab>", function()
  if not cmp.visible() and not copilot_suggestion.is_visible() and luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end, { silent = true })
vim.keymap.set({ "s" }, "<S-Tab>", function()
  if not cmp.visible() and luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })
