vim.g.mapleader = " "

local key_mapping_opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('x', ' ', '', key_mapping_opts)
vim.api.nvim_set_keymap('n', '<Leader>w', ':write<CR>', key_mapping_opts)
vim.api.nvim_set_keymap('n', '<Leader>q', ':quit<CR>', key_mapping_opts)
vim.api.nvim_set_keymap('v', '<Leader>c', '"+y', key_mapping_opts)
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', key_mapping_opts)

-- LSP keymap
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', key_mapping_opts)
vim.api.nvim_set_keymap('n', 'ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', key_mapping_opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', key_mapping_opts)
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', key_mapping_opts)
vim.api.nvim_command([[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]])
vim.api.nvim_command([[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)]])

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
