local g = vim.g

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

-- Call setup:
nvim_tree.setup {}
