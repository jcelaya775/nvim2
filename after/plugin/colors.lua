function ColorMyPencils(color)
	vim.cmd.colorscheme(color)

	-- Uncomment for transparent background
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils("kanagawa-dragon")
