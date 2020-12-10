let mapleader = " "

syntax enable

set mouse=nv
set background=light
set termguicolors
set cursorline
set nu rnu

vmap <leader>c "+y
nmap <leader>w :write<CR>
nmap <leader>q :quit<CR>
nmap <leader>o :GoImports<CR>

" rainbow
let g:rainbow_active = 1

" fcitx
set ttimeoutlen=100

" gruvbox
let g:gruvbox_italic = 1
colorscheme gruvbox

" lightline
let g:lightline = {'colorscheme': 'gruvbox', 'component': {'filename': '%F'}}

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" tagbar
map <C-t> :Tagbar<CR>

" whichkey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=300

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
call deoplete#custom#source('_', 'converters',
	\ ['converter_remove_paren'])
