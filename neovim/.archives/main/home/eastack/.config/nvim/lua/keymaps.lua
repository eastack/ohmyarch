vim.g.mapleader = " "

require 'nvim-tree'.setup{}

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('x', ' ', '', opts)
vim.api.nvim_set_keymap('n', '<Leader>w', ':write<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>q', ':quit<CR>', opts)
vim.api.nvim_set_keymap('v', '<Leader>c', '"+y', opts)
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

--- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)

-- LSP keymap
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_command([[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]])
vim.api.nvim_command([[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)]])

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
