vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.syntax = "on"
vim.opt.mouse = "a"

vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Automatically set <EOL> to unix
vim.cmd([[
    autocmd BufNewFile,BufWritePre * set fileformat=unix
]])

-- Disable auto-commenting new lines
vim.cmd([[
    autocmd FileType * set formatoptions-=cro
]])

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.cmd("setlocal spell spelllang=en_us")

-- Handle format errors
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end

vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

-- Fix for WSL clipboard
if vim.fn.has("wsl") == 1 then
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("Yank", { clear = true }),
    callback = function()
      vim.fn.system("clip.exe", vim.fn.getreg('"'))
    end,
  })
end
