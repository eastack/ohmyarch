------------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
------------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

------------------------------------------------------------
-- Neovim shortcuts
------------------------------------------------------------

-- Change leader to a space
-- vim.g.mapleader = ','

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
map('i', '<leader>s', '<C-c>:w<CR>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

------------------------------------------------------------
-- Applications and Plugins shortcuts
------------------------------------------------------------

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file
