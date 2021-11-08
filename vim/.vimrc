	" Plugins will be downloaded under the specified directory.  
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"Plug 'jnurmine/zenburn'
"Plug 'liuchengxu/vim-which-key'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'valloric/youcompleteme'
Plug 'tbastos/vim-lua'
Plug 'joshdick/onedark.vim'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'bluz71/vim-moonfly-colors'
Plug 'mbbill/undotree'
"'Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"##############################################################################
"##############################################################################
" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

set nocompatible
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set incsearch
set showtabline=2

filetype plugin indent on
syntax on 
set cursorline
" hi CurserLine term=bold cterm=bold guibg=Grey100

set background=dark
"colorscheme moonfly
 colorscheme onedark
"colorscheme gruvbox

set mouse=a
set number
set relativenumber
set viminfo='10,<100,:100,%,n~/.vim/.viminfo
set showcmd
set encoding=utf-8

set ignorecase	"search case insensitive
set smartcase	"only search case sensitive when uppercase is pressent in search string
set scrolloff=5
set hidden

" lightline 

set laststatus=2	"for lightline to show correctly
set noshowmode		"hide vim built in mode indicator
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
	    \            [ 'percent' ],
	    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

"let g:lightline#ale#indicator_checking = "\uf110"
"let g:lightline#ale#indicator_infos = "\uf129"
"let g:lightline#ale#indicator_warnings = "\uf071"
"let g:lightline#ale#indicator_errors = "\uf05e"

"mappings
let mapleader = " "
nnoremap <leader>ta :tabnew<CR>
nnoremap <leader>te :ter<CR>
nnoremap <leader>h 0
nnoremap <leader>l $
nnoremap <leader>^ ^i
nnoremap <leader>ad :ALEDetail<CR>
nnoremap <leader>k :ALEHover<CR>
nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>y :ALEGoToTypeDefinition<CR>
nnoremap <leader>r :ALEFindReferences<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>x :ALEToggleBuffer<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"auto close delemiters
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

"airline
"set noshowmode		"hide vim built in mode indicator
"let g:airline_theme='minimalist'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#ale#enabled = 1

"ALE specific settings
let g:ale_hover_to_floating_preview = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'rust': ['analyzer'],
\}
let g:ale_completion_enabled = 1
