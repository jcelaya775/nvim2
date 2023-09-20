local ts_select_dir_for_grep = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local fb = require("telescope").extensions.file_browser
	local live_grep = require("telescope.builtin").live_grep
	local current_line = action_state.get_current_line()

	fb.file_browser({
		attach_mappings = function(prompt_bufnr)
			require("telescope.actions.set").select:replace(function()
				local entry = action_state.get_selected_entry().Path
				local dir = entry_path:is_dir() and entry_path or entry_path:parent()
				local relative = dir:make_relative(vim.fn.getcwd())
				local absolute = dir:absolute()

				live_grep({
					results_title = relative .. "/",
					cwd = absolute,
					default_text = current_line,
				})
			end)

			return true
		end,
	})
end
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules/", "^.git/", "package-lock.json" },
	},
	pickers = {
		live_grep = {
			mappings = {
				i = {
					["<C-f>"] = ts_select_dir_for_grep,
				},
				n = {
					["<C-f>"] = ts_select_dir_for_grep,
				},
			},
			additional_args = function(_)
				return { "--hidden" }
			end,
		},
		pickers = {
			find_files = {
				hidden = true,
				-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
				find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			},
			hidden = true,
			-- find_command = {
			-- 	"rg",
			-- 	"--files",
			-- 	"--hidden",
			-- 	"--glob=!**/.git/*",
			-- 	"--glob=!**/.idea/*",
			-- 	"--glob=!**/.vscode/*",
			-- 	"--glob=!**/build/*",
			-- 	"--glob=!**/dist/*",
			-- 	"--glob=!**/yarn.lock",
			-- 	"--glob=!**/package-lock.json",
			-- },
		},
	},
})

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local project_dir = os.getenv("PWD") or io.popen("cd"):read()
local buffer_dir = require("telescope.utils").buffer_dir()

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ hidden = true })
end)
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", function()
	builtin.live_grep()
end)
-- vim.keymap.set("n", "<leader>fsc", function()
-- 	builtin.live_grep({ cwd = buffer_dir })
-- end)
vim.keymap.set("n", "<leader>fsr", function()
	builtin.live_grep({ cwd = buffer_dir })
end)
vim.keymap.set("n", "<leader>fso", function()
	builtin.live_grep({ grep_open_files = true })
end)
vim.keymap.set("n", "<leader>fz", function()
	builtin.grep_string({ search = "" })
end)
vim.keymap.set("n", "<leader>fc", function()
	builtin.current_buffer_fuzzy_find()
end)
vim.keymap.set("n", "<leader>fws", function()
	builtin.lsp_workspace_symbols()
end)
vim.keymap.set("n", "<leader>fds", function()
	builtin.lsp_document_symbols()
end)
vim.keymap.set("n", "<leader>fr", function()
	builtin.lsp_references()
end)
vim.keymap.set("n", "<leader>fd", function()
	builtin.diagnostics({ bufnr = 0, severity_bound = "ERROR" })
end)
vim.keymap.set("n", "<leader>sh", function()
	builtin.search_history()
end)

vim.keymap.set("n", "<leader>gca", function()
	builtin.git_commits()
end)
vim.keymap.set("n", "<leader>gcc", function()
	builtin.git_bcommits()
end)
vim.keymap.set("n", "<leader>gbr", function()
	builtin.git_branches()
end)
vim.keymap.set("n", "<leader>gb", function()
	builtin.git_branches()
end)
vim.keymap.set("n", "z=", function()
	builtin.spell_suggest()
end)

vim.keymap.set("n", "<leader><Tab>", function()
	builtin.buffers({
		sort_lastused = true,
		show_all_buffers = true,
		sorter = require("telescope.sorters").get_substr_matcher(),
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.delete_buffer)
			map("n", "<c-d>", actions.delete_buffer)
			return true
		end,
	})
end)

local state = require("telescope.actions.state")
local function move_telescope_picker_down()
	local current_picker = state.get_current_picker()

	if current_picker then
		vim.api.nvim_feedkeys("<Tab>", "n", true)
		local new_picker = current_picker.move_selection_next()

		if new_picker then
			state.set_current_picker(new_picker)
			actions.close(current_picker)
			actions.run(new_picker)
		end
	end
end

vim.keymap.set("n", "<leader><S-Tab>", function()
	builtin.buffers({
		sort_lastused = true,
		show_all_buffers = true,
		sorter = require("telescope.sorters").get_substr_matcher(),
		attach_mappings = function(bufnr, map)
			map("i", "<c-d>", actions.delete_buffer)
			map("n", "<c-d>", actions.delete_buffer)
			return true
		end,
	})

	move_telescope_picker_down()
	-- vim.defer_fn(function()
	-- 	move_telescope_picker_down()
	-- end, 1000)
	-- vim.api.nvim_feedkeys("<", "n", true)

	-- -- Define a function to check if Telescope is active
	-- local function is_telescope_active()
	-- 	return vim.fn.exists("g:telescope_state") == 1
	-- end
	--
	-- -- Define a function to be executed when Telescope is active
	-- local function on_telescope_active()
	-- 	if is_telescope_active() then
	-- 		print("Telescope is active")
	-- 		local bufnr = vim.api.nvim_get_current_buf()
	-- 		actions.move_to_top({ buffer = bufnr })
	-- 		vim.api.nvim_feedkeys("on open", "n", true)
	-- 	end
	-- end

	-- print(vim.fn.exists("g:telescope_state"))
	-- if vim.fn.exists("g:telescope_state") == 1 then
	-- 	-- local function on_telescope_open()
	-- 	-- local bufnr = vim.api.nvim_get_current_buf()
	-- 	-- actions.move_to_top({ buffer = bufnr })
	-- 	-- actions.move_selection_next()
	-- 	local status = vim.fn.exists("g:telescope_state") == 1 and "exists" or "not exists"
	-- 	vim.api.nvim_feedkeys(status, "n", true)
	-- end
	-- vim.defer_fn(function()
	-- 	-- local key = vim.api.nvim_replace_termcodes("<down>", true, false, true)
	-- 	-- vim.api.nvim_feedkeys(key, "n", true)
	-- 	local bufnr = vim.api.nvim_get_current_buf()
	-- 	actions.move_selection_next({ buffer = bufnr })
	-- end, 1000)

	-- vim.cmd([[autocmd BufEnter * lua on_telescope_active()]])
end)

vim.keymap.set("n", "<leader>fo", function()
	builtin.oldfiles()
end)

local function close_buffer()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_delete(bufnr, { force = true })

	local tree = require("nvim-tree.api").tree
	if tree.is_visible() then
		-- vim.api.nvim_command("NvimTreeClose")
		-- vim.api.nvim_command("NvimTreeOpen")
		-- vim.api.nvim_command("wincmd p") -- mave to previous window
	end
end
vim.keymap.set("n", "<leader>x", close_buffer)
vim.keymap.set("n", "<leader>q", close_buffer)

-- -- Import necessary Telescope modules
-- local actions = require("telescope.actions")
-- local finders = require("telescope.finders")
-- local pickers = require("telescope.pickers")
-- local conf = require("telescope.config").values
--
-- -- Define the custom function to display search results in Telescope
-- local function search_results(opts)
-- 	-- Create a new picker
-- 	pickers
-- 		.new(opts, {
-- 			prompt_title = "Search Results",
-- 			finder = finders.new_table({
-- 				results = opts.results,
-- 			}),
-- 			sorter = conf.generic_sorter(opts),
-- 			attach_mappings = function(prompt_bufnr)
-- 				actions.select_default:replace(function()
-- 					local selection = actions.get_selected_entry(prompt_bufnr)
-- 					actions.close(prompt_bufnr)
-- 					-- Handle the selected result (e.g., open the file)
-- 					-- You can customize this part to fit your needs
-- 					vim.cmd("edit " .. selection.value)
-- 				end)
-- 				return true
-- 			end,
-- 		})
-- 		:find()
-- end
--
-- print(search_results())
