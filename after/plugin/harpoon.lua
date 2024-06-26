local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<A-e>", ui.toggle_quick_menu)

function Open_harpoon_file(file_index)
  ui.nav_file(file_index)
  center_screen()
end

vim.keymap.set("n", "<A-j>", function()
  ui.nav_file(1)
  center_screen()
end)
vim.keymap.set("n", "<A-k>", function()
  ui.nav_file(2)
  center_screen()
end)
vim.keymap.set("n", "<A-l>", function()
  ui.nav_file(3)
  center_screen()
end)
vim.keymap.set("n", "<A-;>", function()
  ui.nav_file(4)
  center_screen()
end)
vim.keymap.set("n", "<A-'>", function()
  ui.nav_file(5)
  center_screen()
end)
vim.keymap.set("n", "<A-u>", function()
  ui.nav_file(6)
  center_screen()
end)
vim.keymap.set("n", "<A-i>", function()
  ui.nav_file(7)
  center_screen()
end)
vim.keymap.set("n", "<A-o>", function()
  ui.nav_file(8)
  center_screen()
end)
