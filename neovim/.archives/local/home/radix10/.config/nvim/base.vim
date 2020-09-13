syntax enable
set background=light
set termguicolors
set cursorline
set nu rnu
set ttimeoutlen=100

vmap <leader>c "+y
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" gruvbox
let g:gruvbox_italic = 1
colorscheme gruvbox

" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" tagbar
map <C-t> :Tagbar<CR>

"space to command mode
nnoremap <space> :
vnoremap <space> :
