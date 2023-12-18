local mason_tool_installer = require("mason-tool-installer")
require("mason").setup({
  mason_tool_installer.setup({
    ensure_installed = {
      "prettier", -- prettier formatter
      "eslint_d", -- javascript linter
      "stylua", -- lua formatter
      "isort", -- python formatter
      "black", -- python formatter
      "pylint", -- python linter
      "mypy",
      "ruff",
    },
  }),
})

vim.keymap.set("n", "<leader>ma", ":Mason<CR>")
