local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(path)

vim.keymap.set("n", "<leader>bp", "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>bm", function()
  require("dap-python").test_method()
end)
