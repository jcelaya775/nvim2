local mason_tool_installer = require("mason-tool-installer")
require("mason").setup({
  mason_tool_installer.setup({
    ensure_installed = {
      "prettier", -- prettier formatter
      "stylua", -- lua formatter
      "isort", -- python formatter
      "black", -- python formatter
      "eslint_d", -- javascript linter
      "pylint", -- python linter
    },
  }),
})

vim.keymap.set("n", "<leader>ma", ":Mason<CR>")
