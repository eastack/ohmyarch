return require('packer').startup(function()
  use "https://ghproxy.com/https://github.com/hrsh7th/cmp-nvim-lsp"
  use "https://ghproxy.com/https://github.com/hrsh7th/cmp-buffer"
  use "https://ghproxy.com/https://github.com/hrsh7th/nvim-cmp"
  use "https://ghproxy.com/https://github.com/wbthomason/packer.nvim"
  use "https://ghproxy.com/https://github.com/morhetz/gruvbox"
  use "https://ghproxy.com/https://github.com/editorconfig/editorconfig-vim"
  use "https://ghproxy.com/https://github.com/nvim-lua/completion-nvim"
  use "https://ghproxy.com/https://github.com/nvim-treesitter/nvim-treesitter"
  use "https://ghproxy.com/https://github.com/neovim/nvim-lspconfig"
  use "https://ghproxy.com/https://github.com/junegunn/vim-easy-align"
  use "https://ghproxy.com/https://github.com/easymotion/vim-easymotion"
  use {
    "https://ghproxy.com/https://github.com/kyazdani42/nvim-tree.lua",
    requires = "https://ghproxy.com/https://github.com/kyazdani42/nvim-web-devicons"
  }
  use {
    "https://ghproxy.com/https://github.com/nvim-telescope/telescope.nvim",
    requires = {
      {"https://ghproxy.com/https://github.com/nvim-lua/popup.nvim"}, 
      {"https://ghproxy.com/https://github.com/nvim-lua/plenary.nvim"}
    },
  }
end)

