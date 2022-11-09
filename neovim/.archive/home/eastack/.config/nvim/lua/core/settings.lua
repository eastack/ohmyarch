------------------------------------------------------------
-- General Neovim settings and configuration
------------------------------------------------------------

------------------------------------------------------------
-- Neovim API aliases
------------------------------------------------------------
local cmd = vim.cmd                   -- Execute Vim commands
local exec = vim.api.nvim_exec 	      -- Execute Vimscript
local g = vim.g         	      -- Global variables
local opt = vim.opt         	      -- Set options (global/buffer/windows-scoped)


------------------------------------------------------------
-- General 中文
------------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.completeopt = 'menuone,noselect'  -- Autocomplete options


-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true                     -- Show line number
opt.relativenumber = true             -- Enable relative number
opt.cursorline = true                 -- Enable cursor line
opt.showmatch = true                  -- Highlight matching parenthesis
opt.foldmethod = 'marker'             -- Enable folding (default 'foldmarker')
opt.colorcolumn = '100'               -- Line lenght marker at 100 columns
opt.splitright = true                 -- Vertical split to the right
opt.splitbelow = true                 -- Orizontal split to the bottom
opt.linebreak = true                  -- Wrap on word boundary
opt.termguicolors = true              -- Enable 24-bit RGB colors

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true                     -- Enable background buffers
opt.updatetime = 400                  -- ms to wait for trigger 'document_highlight'
