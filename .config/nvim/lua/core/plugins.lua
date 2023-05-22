local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- plugin manager
  use 'wbthomason/packer.nvim'

  -- appearance
  use 'ellisonleao/gruvbox.nvim'
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'ojroques/nvim-hardline'
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'NvChad/nvim-colorizer.lua'

  -- utils
  use { 'akinsho/toggleterm.nvim', tag = '*' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { 'nvim-lua/plenary.nvim' } }
  use 'Pocco81/auto-save.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'mrjones2014/nvim-ts-rainbow'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'terrortylor/nvim-comment'
  use { "kylechui/nvim-surround", tag = "*" }
  use { "rest-nvim/rest.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }

  -- self-config
  use 'tpope/vim-fugitive'
  use 'wakatime/vim-wakatime'
  use { "kkoomen/vim-doge", run = ':call doge#install()' }

-- lsp
  use { 'williamboman/mason.nvim', run = ":MasonUpdate" }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
   use { 'jose-elias-alvarez/null-ls.nvim', requires = "nvim-lua/plenary.nvim" }

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  
  -- snippet
  use { 'L3MON4D3/LuaSnip', dependencies = { "rafamadriz/friendly-snippets" } }
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
