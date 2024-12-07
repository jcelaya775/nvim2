local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("ellisonleao/gruvbox.nvim")
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")
  use("folke/tokyonight.nvim")
  use("nvim-treesitter/nvim-treesitter")
  use("nvim-treesitter/playground")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use("tpope/vim-rhubarb")
  use("nvim-lua/plenary.nvim")
  use("simeji/winresizer")
  use("ThePrimeagen/harpoon")
  -- use 'romgrk/barbar.nvim'
  use("terrortylor/nvim-comment")
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    -- or                            , branch = '0.1.x',
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  })
  use({ "rose-pine/neovim", as = "rose-pine" })
  use({
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
    after = { "nvim-cmp" },        -- if a completion plugin is using tabs load it before
  })
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      {
        "neovim/nvim-lspconfig", -- Required
        requires = {
          "antosha417/nvim-lsp-file-operations",
        },
      },
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },                  -- Required
      { "hrsh7th/cmp-nvim-lsp" },              -- Required
      { "hrsh7th/cmp-path" },                  -- Required
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-cmdline" },
      { "dcampos/nvim-snippy" },
      { "dcampos/cmp-snippy" },
      { "saadparwaiz1/cmp_luasnip" },
      { "onsails/lspkind.nvim" },
    },
  })
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use({
    "L3MON4D3/LuaSnip",
    tag = "v2.*",
    run = "make install_jsregexp",
    requires = {
      "rafamadriz/friendly-snippets",
      "molleweide/LuaSnip-snippets.nvim",
    },
  })
  use("lukas-reineke/indent-blankline.nvim")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("jose-elias-alvarez/null-ls.nvim")
  use("brenoprata10/nvim-highlight-colors")
  use("rafamadriz/friendly-snippets")
  use("panozzaj/vim-autocorrect")
  use("zbirenbaum/copilot.lua")
  use("unblevable/quick-scope")
  -- use("ggandor/leap.nvim")
  use("folke/flash.nvim")
  use("RRethy/vim-illuminate")
  use("romainl/vim-cool")
  use("Mofiqul/vscode.nvim")
  use("projekt0n/github-nvim-theme")
  use("petertriho/nvim-scrollbar")
  use("onsails/lspkind.nvim")
  use("ray-x/lsp_signature.nvim")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  use({ "mfussenegger/nvim-dap-python", requires = { "mfussenegger/nvim-dap" } })
  use("akinsho/bufferline.nvim")
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  })
  use({ "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" })
  use("kvrohit/mellow.nvim") -- color theme
  use("christoomey/vim-tmux-navigator")
  use("machakann/vim-highlightedyank")
  use("mg979/vim-visual-multi")
  use("stevearc/conform.nvim")
  use("mfussenegger/nvim-lint")
  use("WhoIsSethDaniel/mason-tool-installer.nvim")
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use("stevearc/dressing.nvim")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
  use({
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use({
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  })
  use("famiu/bufdelete.nvim")
  use("nvim-neotest/nvim-nio")
  use("fatih/vim-go")
  use("hedyhli/outline.nvim")
  use({ "shortcuts/no-neck-pain.nvim", tag = "*" })
  use("rebelot/kanagawa.nvim")
  use({ "jghauser/follow-md-links.nvim" })
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use({
    "MeanderingProgrammer/render-markdown.nvim",
    after = { "nvim-treesitter" },
    -- requires = { "echasnovski/mini.nvim", opt = true }, -- if you use the mini.nvim suite
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
      require("render-markdown").setup({})
    end,
  })
  -- use({
  -- 	"3rd/image.nvim",
  -- 	config = function()
  -- 		require("image").setup({
  -- 			backend = "kitty",
  -- 			integrations = {
  -- 				markdown = {
  -- 					enabled = true,
  -- 					clear_in_insert_mode = false,
  -- 					download_remote_images = true,
  -- 					only_render_image_at_cursor = false,
  -- 					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
  -- 				},
  -- 				neorg = {
  -- 					enabled = true,
  -- 					clear_in_insert_mode = false,
  -- 					download_remote_images = true,
  -- 					only_render_image_at_cursor = false,
  -- 					filetypes = { "norg" },
  -- 				},
  -- 				html = {
  -- 					enabled = false,
  -- 				},
  -- 				css = {
  -- 					enabled = false,
  -- 				},
  -- 			},
  -- 			max_width = nil,
  -- 			max_height = nil,
  -- 			max_width_window_percentage = nil,
  -- 			max_height_window_percentage = 50,
  -- 			window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  -- 			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  -- 			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  -- 			tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  -- 			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
  -- 		})
  -- 	end,
  -- })
  use("kaymmm/bullets.nvim")
end)
