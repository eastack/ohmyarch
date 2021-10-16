return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use "morhetz/gruvbox"
  use "editorconfig/editorconfig-vim"
  use "nvim-lua/completion-nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "neovim/nvim-lspconfig"
  use 'junegunn/vim-easy-align'
  use "easymotion/vim-easymotion"
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }
end)

