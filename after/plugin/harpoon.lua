local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<A-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<A-j>", function()
  ui.nav_file(1)
  vim.api.nvim_feedkeys("zz", "n", true)
end)
vim.keymap.set("n", "<A-k>", function()
  ui.nav_file(2)
  vim.api.nvim_feedkeys("zz", "n", true)
end)
vim.keymap.set("n", "<A-l>", function()
  ui.nav_file(3)
  vim.api.nvim_feedkeys("zz", "n", true)
end)
vim.keymap.set("n", "<A-;>", function()
  ui.nav_file(4)
  vim.api.nvim_feedkeys("zz", "n", true)
end)
vim.keymap.set("n", "<A-'>", function()
  ui.nav_file(5)
  vim.api.nvim_feedkeys("zz", "n", true)
end)
vim.keymap.set("n", "<A-u>", function()
  ui.nav_file(6)
  vim.api.nvim_feedkeys("zz", "n", true)
end)
vim.keymap.set("n", "<A-i>", function()
  ui.nav_file(7)
  vim.api.nvim_feedkeys("zz", "n", true)
end)
vim.keymap.set("n", "<A-o>", function()
  ui.nav_file(8)
  vim.api.nvim_feedkeys("zz", "n", true)
end)
