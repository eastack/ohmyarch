let mapleader = " "

set ttimeoutlen=100

vmap <leader>c "+y
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" gruvbox
let g:gruvbox_italic = 1
colorscheme gruvbox
set background=light
set termguicolors
syntax enable
set cursorline
set nu rnu

" lightline
let g:lightline = {'colorscheme': 'gruvbox'}

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" tagbar
map <C-t> :Tagbar<CR>

lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.gopls.setup{}
nvim_lsp.sumneko_lua.setup{}
nvim_lsp.pyls.setup{}
EOF

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
