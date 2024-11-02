require("Bullets").setup({
	checkbox = {
		nest = true,
		markers = " x",
		toggle_partials = true,
	},
})

-- TODO: Remove <Space> leader mapping and add <CR> shortcut to toggle checkbox
-- vim.g.bullets_enabled_file_types = { "markdown" }
-- vim.g.bullets_checkbox_partials_toggle = 0
-- vim.g.bullets_checkbox_markers = "    x"
-- -- vim.g.bullets_mapping_leader = "|"
--
-- vim.keymap.set("n", "<CR>", "<Plug>(bullets-toggle-checkbox)")
-- -- vim.g.bullets_custom_mappings = {
-- -- 	{ "nmap", "<CR>", "<Plug>(bullets-toggle-checkbox)" },
-- -- }
