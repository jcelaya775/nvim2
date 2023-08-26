local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'folke/tokyonight.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'
  use 'feline-nvim/feline.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use({
   'lewis6991/gitsigns.nvim',
   requires = {'nvim-lua/plenary.nvim'},
  })
  use 'nvim-lua/plenary.nvim'
  use 'simeji/winresizer'
  use 'ThePrimeagen/harpoon'
  -- use 'romgrk/barbar.nvim'
  use 'terrortylor/nvim-comment'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'

  use {
  	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  	  -- or                            , branch = '0.1.x',
  	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use {
    'abecodes/tabout.nvim',
    wants = {'nvim-treesitter'}, -- or require if not used so far
    after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
  
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'hrsh7th/cmp-path'},     -- Required
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-cmdline'},
      {'dcampos/nvim-snippy'},
      {'dcampos/cmp-snippy'},
    }
  }
  use 'windwp/nvim-autopairs'
  use({
    'L3MON4D3/LuaSnip',
    tag = "v2.*",
    run = "make install_jsregexp",
  })
  use 'lukas-reineke/indent-blankline.nvim'
  use 'mhartington/formatter.nvim'
end)
