local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local ghproxy = 'https://ghproxy.com/https://github.com/'

-- Automatically install packer
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    ghproxy .. '/wbthomason/packer.nvim',
    install_path
  })
end

-- Autocommand that reloads neovim whenver save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

packer = require 'packer'

packer.init{
  git = {
    default_url_format = ghproxy .. '%s'
  }
}

-- Install plugins
return packer.startup(function(use)
  -- Packer self manage 
  use 'wbthomason/packer.nvim'
  
  -- File explorer
  use 'kyazdani42/nvim-tree.lua'
  
  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'
  
  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  
  -- Color scheme
  use 'ellisonleao/gruvbox.nvim'

  use 'kdheepak/tabline.nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  
  -- LSP
  use 'neovim/nvim-lspconfig'
  
  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }
end)
