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
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    -- Use all default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Remove a default mapping
    vim.keymap.del("n", "<C-e>", { buffer = bufnr })
  end,
})

vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>")

require("lsp-file-operations").setup()
