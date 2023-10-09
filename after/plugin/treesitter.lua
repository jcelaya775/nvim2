require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "javascript",
    "typescript",
    "rust",
    "python",
    "c",
    "cpp",
    "java",
    "lua",
    "vim",
    "vimdoc",
    "query",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = ")",
      node_incremental = ")",
      scope_incremental = false,
      node_decremental = "(",
    },
  },
})
