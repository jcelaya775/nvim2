vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				separator = true,
				text_align = "left",
			},
		},
		close_command = function(bufnum)
			require("bufdelete").bufdelete(bufnum, true)
		end,
		sort_by = "relative",
	},
})

-- Cycle tabs
vim.keymap.set("n", "<S-A-h>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<S-A-l>", "<cmd>BufferLineCycleNext<CR>")
-- Kitty terminal (mac config)
vim.keymap.set("n", "\\tb", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "\\tff", "<cmd>BufferLineCycleNext<CR>")

-- Move tabs
vim.keymap.set("n", "<C-A-h>", "<cmd>BufferLineMovePrev<CR>")
vim.keymap.set("n", "<C-A-l>", "<cmd>BufferLineMoveNext<CR>")

vim.keymap.set("n", "<S-A-k>", "<cmd>BufferLinePick<CR>")

-- Go to nth buffer
local set_keymap = vim.api.nvim_set_keymap
set_keymap("n", "<leader>1", "<CMD>lua require'bufferline'.go_to_buffer(1)<CR>", {})
set_keymap("n", "<leader>2", "<CMD>lua require'bufferline'.go_to_buffer(2)<CR>", {})
set_keymap("n", "<leader>3", "<CMD>lua require'bufferline'.go_to_buffer(3)<CR>", {})
set_keymap("n", "<leader>4", "<CMD>lua require'bufferline'.go_to_buffer(4)<CR>", {})
set_keymap("n", "<leader>5", "<CMD>lua require'bufferline'.go_to_buffer(5)<CR>", {})
set_keymap("n", "<leader>6", "<CMD>lua require'bufferline'.go_to_buffer(6)<CR>", {})
set_keymap("n", "<leader>7", "<CMD>lua require'bufferline'.go_to_buffer(7)<CR>", {})
set_keymap("n", "<leader>8", "<CMD>lua require'bufferline'.go_to_buffer(8)<CR>", {})
set_keymap("n", "<leader>9", "<CMD>lua require'bufferline'.go_to_buffer(9)<CR>", {})
set_keymap("n", "<leader>0", "<CMD>lua require'bufferline'.go_to_buffer(10)<CR>", {})
-- Mac
set_keymap("n", "\\t1", "<CMD>lua require'bufferline'.go_to_buffer(1)<CR>", {})
set_keymap("n", "\\t2", "<CMD>lua require'bufferline'.go_to_buffer(2)<CR>", {})
set_keymap("n", "\\t3", "<CMD>lua require'bufferline'.go_to_buffer(3)<CR>", {})
set_keymap("n", "\\t4", "<CMD>lua require'bufferline'.go_to_buffer(4)<CR>", {})
set_keymap("n", "\\t5", "<CMD>lua require'bufferline'.go_to_buffer(5)<CR>", {})
set_keymap("n", "\\t6", "<CMD>lua require'bufferline'.go_to_buffer(6)<CR>", {})
set_keymap("n", "\\t7", "<CMD>lua require'bufferline'.go_to_buffer(7)<CR>", {})
set_keymap("n", "\\t8", "<CMD>lua require'bufferline'.go_to_buffer(8)<CR>", {})
set_keymap("n", "\\t9", "<CMD>lua require'bufferline'.go_to_buffer(9)<CR>", {})
