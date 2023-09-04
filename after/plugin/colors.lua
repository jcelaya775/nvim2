function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

-- vim.cmd("highlight Normal guibg=none")
-- vim.cmd("highlight NonText guibg=none")
-- vim.cmd("highlight Normal ctermbg=none")
-- vim.cmd("highlight NonText ctermbg=none")
