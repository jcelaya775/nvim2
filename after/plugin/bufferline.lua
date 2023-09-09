vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				-- text = "Nvim Tree",
				separator = true,
				text_align = "left",
			},
		},
		close_command = "Bdelete! %d", -- can be a string | function, | false see "Mouse actions"
		sort_by = "relative",
	},
})

vim.keymap.set("n", "<C-A-h>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-A-l>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-A-h>", "<cmd>BufferLineMovePrev<CR>")
vim.keymap.set("n", "<S-A-l>", "<cmd>BufferLineMoveNext<CR>")
vim.keymap.set("n", "gp", "<cmd>BufferLinePick<CR>")
-- vim.keymap.set("n", "<leader>x", function()
-- 	print("%d")
-- 	require("bufferline").buf_delete(vim.fn.bufnr())
-- end)
--
-- 	-- if there is at least one buffer left, go to the previous buffer
-- 	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
-- 	-- print(buffers)
-- 	-- print(vim.fn.buflisted(vim.fn.bufnr()))
-- 	if vim.fn.buflisted(vim.fn.bufnr()) == 1 then
-- 		vim.cmd.BufferLineCycleNext()
-- 	end
-- end)
--
-- local buffers = vim.api.nvim_list_bufs()
-- for _, buffer in ipairs(buffers) do
-- 	-- print(vim.api.nvim_buf_get_name(buffer))
-- end
--
-- -- print("***")
-- -- print(table.getn(buffers))
-- -- print("***")
-- for _, buffer in ipairs(buffers) do
-- 	local full_buffername = vim.api.nvim_buf_get_name(buffer)
-- 	-- print(full_buffername)
-- 	if full_buffername ~= "" and not string.find(full_buffername, "NvimTree_1") then
-- 		local index = string.find(full_buffername, "/[^/]*$")
-- 		local rel_buffername = full_buffername.sub(full_buffername, index + 1)
-- 		-- print(buffer)
-- 	end
-- end
