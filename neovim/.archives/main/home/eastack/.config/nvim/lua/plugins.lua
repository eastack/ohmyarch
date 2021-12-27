local ghproxy = 'https://ghproxy.com/https://github.com/'
local packer = require('packer')

return packer.startup(function()
  use (ghproxy .. 'wbthomason/packer.nvim')
  use (ghproxy .. 'morhetz/gruvbox')
  use (ghproxy .. 'editorconfig/editorconfig-vim')
  use (ghproxy .. 'nvim-treesitter/nvim-treesitter')
  use (ghproxy .. 'neovim/nvim-lspconfig')
  use (ghproxy .. 'hrsh7th/nvim-cmp')
  use (ghproxy .. 'hrsh7th/cmp-nvim-lsp')
  use (ghproxy .. 'hrsh7th/cmp-buffer')
  use (ghproxy .. 'hrsh7th/cmp-path')
  use (ghproxy .. 'hrsh7th/cmp-cmdline')
  use (ghproxy .. 'hrsh7th/vim-vsnip')
  use (ghproxy .. 'windwp/nvim-autopairs')
  use (ghproxy .. 'junegunn/vim-easy-align')
  use (ghproxy .. 'easymotion/vim-easymotion')
  use (ghproxy .. 'lilydjwg/fcitx.vim')

  use {
    (ghproxy .. 'kyazdani42/nvim-tree.lua'),
    requires = (ghproxy .. 'kyazdani42/nvim-web-devicons')
  }

  use {
    (ghproxy .. 'nvim-telescope/telescope.nvim'),
    requires = {
      {(ghproxy .. 'nvim-lua/popup.nvim')},
      {(ghproxy .. 'nvim-lua/plenary.nvim')},
      {(ghproxy .. 'nvim-telescope/telescope-fzf-native.nvim'), run='make'}
    },
  }
end)

