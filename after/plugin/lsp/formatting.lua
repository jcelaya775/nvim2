local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    python = { "isort", "black" },
    java = { "clang-format" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },

  -- Range formatting does not work correctly/consistenly
  -- Hence, formatting only-changed-lines is not possible with conform
  vim.keymap.set({ "n", "v", "x", "o" }, "<leader>mp", function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    })
  end),
})
