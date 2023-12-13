local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

telescope.setup({
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
    },
  },
})

telescope.load_extension("fzf")

local project_dir = os.getenv("PWD") or io.popen("cd"):read()

-- Files
vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files({ hidden = true })
end)
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fo", function()
  builtin.oldfiles()
end)

-- Search
vim.keymap.set("n", "<leader>fsw", function()
  builtin.grep_string()
end)
vim.keymap.set("n", "<leader>fss", function()
  builtin.live_grep()
end)
vim.keymap.set("n", "<leader>fsc", function()
  local file = vim.fn.expand("%:p")
  builtin.live_grep({ search_dirs = { file } })
end)
vim.keymap.set("n", "<leader>fsd", function()
  builtin.live_grep({ cwd = utils.buffer_dir() })
end)
-- TODO: Implement relative search (useful for large projects)
-- Need to create function that performs relative search (searches backwards towards root)
-- and pass in results to telescope
-- vim.keymap.set("n", "<leader>fsr", function()
-- 	builtin.live_grep({
-- 		cwd = utils.buffer_dir(),
-- 		search_dirs = { project_dir },
-- 	})
-- end)
vim.keymap.set("n", "<leader>fz", function()
  builtin.grep_string({ search = "" })
end)
vim.keymap.set("n", "<leader>fc", function()
  builtin.current_buffer_fuzzy_find()
end)
vim.keymap.set("n", "<leader>fso", function()
  builtin.live_grep({ grep_open_files = true })
end)

-- Symbols/References
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

-- Git
vim.keymap.set("n", "<leader>gca", function()
  builtin.git_commits()
end)
vim.keymap.set("n", "<leader>gcc", function()
  builtin.git_bcommits()
end)
vim.keymap.set("n", "<leader>gbr", function()
  builtin.git_branches()
end)

-- Spelling
vim.keymap.set("n", "z=", function()
  builtin.spell_suggest()
end)

-- Buffers
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
