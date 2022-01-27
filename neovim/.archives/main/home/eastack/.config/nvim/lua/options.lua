vim.o.background = "light"
vim.cmd([[colorscheme gruvbox]])
vim.o.cursorline = true
-- LSP 当前 buffer 未保存时跳转报错
vim.o.hidden = true
vim.o.mouse = "nv"
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true

-- 补全代码时模糊匹配
vim.g["completion_matching_strategy_list"] = {'exact', 'substring', 'fuzzy', 'all'}
vim.g["completion_trigger_character"] = {'.', '::'}
-- 补全菜单显示逻辑
vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
-- 在补全时不显示详细信息
vim.opt.shortmess:append({ c = true })
