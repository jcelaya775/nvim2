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
-- Ghostty remap <C-;> to <S-A-a>
vim.keymap.set({ "n", "v", "x" }, "<S-A-a>", function()
  require("flash").jump()
end)
