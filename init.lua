require("config")
require("plugins")
local ft = vim.api.nvim_buf_get_option(0, "filetype")
print(ft)
