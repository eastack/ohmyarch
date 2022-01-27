local ghproxy = 'https://ghproxy.com/https://github.com/'
local packer = require('packer')

return packer.startup(function()
  use (ghproxy .. 'wbthomason/packer.nvim')
  use (ghproxy .. 'ellisonleao/gruvbox.nvim')
  use (ghproxy .. 'editorconfig/editorconfig-vim')
  use (ghproxy .. 'nvim-treesitter/nvim-treesitter')

  -- Lsp
  use (ghproxy .. 'neovim/nvim-lspconfig')
  use (ghproxy .. 'hrsh7th/nvim-cmp')
  use (ghproxy .. 'hrsh7th/cmp-nvim-lsp')
  use (ghproxy .. 'hrsh7th/cmp-buffer')
  use (ghproxy .. 'hrsh7th/cmp-path')
  use (ghproxy .. 'hrsh7th/cmp-cmdline')

  -- Snippets
  use (ghproxy .. 'saadparwaiz1/cmp_luasnip')
  use (ghproxy .. 'L3MON4D3/LuaSnip')

  use (ghproxy .. 'windwp/nvim-autopairs')
  use (ghproxy .. 'junegunn/vim-easy-align')
  use (ghproxy .. 'phaazon/hop.nvim')
  use (ghproxy .. 'lilydjwg/fcitx.vim')
  use (ghproxy .. 'kyazdani42/nvim-web-devicons')
  use (ghproxy .. 'kyazdani42/nvim-tree.lua')
  use (ghproxy .. 'nvim-lualine/lualine.nvim')
  use {
    (ghproxy .. 'nvim-telescope/telescope.nvim'),
    requires = {
      {(ghproxy .. 'nvim-lua/popup.nvim')},
      {(ghproxy .. 'nvim-lua/plenary.nvim')},
      {(ghproxy .. 'nvim-telescope/telescope-fzf-native.nvim'), run='make'}
    },
  }
end)

