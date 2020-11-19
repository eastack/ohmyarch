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

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=300
