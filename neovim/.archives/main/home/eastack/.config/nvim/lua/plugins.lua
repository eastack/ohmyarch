return require('packer').startup(function()
  use "wbthomason/packer.nvim"
  use "editorconfig/editorconfig-vim"
  use "windwp/nvim-autopairs"
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use "morhetz/gruvbox"
  use "neovim/nvim-lspconfig"
  use "nvim-lua/completion-nvim"
  use "nvim-lua/lsp-status.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use "Olical/conjure"
  use "easymotion/vim-easymotion"
end)

