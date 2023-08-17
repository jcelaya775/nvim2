-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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
  use { 'feline-nvim/feline.nvim', branch = '0.5-compat' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'simeji/winresizer'
  use 'ThePrimeagen/harpoon'
  -- use 'romgrk/barbar.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })
end)
