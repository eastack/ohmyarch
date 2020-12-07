" remap leader key
let mapleader = " "

" for fcitx.vim
set ttimeoutlen=100

" enable mouse support
set mouse=nv

" enable line number
set nu rnu

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

" lightline
let g:lightline = {'colorscheme': 'gruvbox', 'component': {'filename': '%F'}}

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" tagbar
map <C-t> :Tagbar<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=300

" deoplete for vim-go
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
call deoplete#custom#source('_', 'converters',
	\ ['converter_remove_paren'])

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
