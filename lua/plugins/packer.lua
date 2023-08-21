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
  use { 'feline-nvim/feline.nvim', branch = '0.5-compat' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'simeji/winresizer'
  use 'ThePrimeagen/harpoon'
  -- use 'romgrk/barbar.nvim'
  use 'terrortylor/nvim-comment'

  use {
  	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  	  -- or                            , branch = '0.1.x',
  	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  -- Lua
  use {
    'abecodes/tabout.nvim',
    wants = {'nvim-treesitter'}, -- or require if not used so far
    -- after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }
  -- use {
  --   'williamboman/mason.nvim',
  --   'williamboman/mason-lspconfig.nvim',
  --   'neovim/nvim-lspconfig',
  --   'mhartington/formatter.nvim'
  -- }
  -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
end)
