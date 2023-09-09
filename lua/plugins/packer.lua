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
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("feline-nvim/feline.nvim")
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
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" }, -- or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-path" }, -- Required
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
	use("sbdchd/neoformat")
	use("zbirenbaum/copilot.lua")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use("unblevable/quick-scope")
	use("ggandor/leap.nvim")
	use("RRethy/vim-illuminate")
	use("romainl/vim-cool")
	use("Mofiqul/vscode.nvim")
	use("projekt0n/github-nvim-theme")
	use("petertriho/nvim-scrollbar")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	use("onsails/lspkind.nvim")
	use("ray-x/lsp_signature.nvim")
	-- use({ "mfussenegger/nvim-dap-python", requires = { "mfussenegger/nvim-dap" } })
	use("akinsho/bufferline.nvim")
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
end)
