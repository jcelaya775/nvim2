-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "name",
	view = {
		number = true,
		relativenumber = true,
		preserve_window_proportions = true,
		adaptive_size = true,
		centralize_selection = false,
	},
	filters = {
		-- dotfiles = true,
	},
	actions = {
		open_file = {
			resize_window = false,
		},
		expand_all = {
			exclude = { "node_modules", ".git/" },
			max_folder_discovery = 100,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	-- git = {
	-- 	enable = true,
	-- 	ignore = false,
	-- 	timeout = 500,
	-- },
	-- tab = {
	-- 	sync = {
	-- 		open = true,
	-- 		close = true,
	-- 		-- ignore = {},
	-- 	},
	-- },
})

vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>")
