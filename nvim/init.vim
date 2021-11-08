" Plugins will be downloaded under the specified directory.  
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'joshdick/onedark.vim'
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'simrat39/rust-tools.nvim'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'arkav/lualine-lsp-progress'

"Plug 'vim-airline/vim-airline-themes'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
let g:gruvbox_contrast_dark = 'soft'

"set nocompatible
set number
set relativenumber
set scrolloff=10
"set cursorline
set guicursor=

set showtabline=2
set title titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
"set viminfo='10,<100,:100,%,n~/.vim/.viminfo
set hidden
set noshowmode		"hide vim built in mode indicator

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
filetype plugin indent on
set autoindent

set termguicolors
syntax on 
set background=dark
colorscheme gruvbox
"colorscheme onedark
set noerrorbells
set signcolumn=yes

set mouse=a
set showcmd
set encoding=utf-8

set nohlsearch
set incsearch
set ignorecase	"search case insensitive
set smartcase	"only search case sensitive when uppercase is pressent in search string

set undodir=~/.vim/undodir
set undofile

"mappings
let mapleader = " "
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
nnoremap <leader>ta :tabnew<CR>
nnoremap <leader>te :ter<CR>
nnoremap ö :

"nnoremap <leader>^ ^i not needed in nvim
nnoremap <leader>h 0
nnoremap <leader>l $
vnoremap <leader>h 0
vnoremap <leader>l $
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>w :w<CR>

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>qf :Telescope quickfix<CR>
nnoremap <leader>r :Telescope lsp_references<CR>
nnoremap <leader>i :Telescope lsp_implementations<CR>
nnoremap <leader>d :Telescope lsp_definitions<CR>
nnoremap <leader>y :Telescope lsp_type_definitions<CR>
nnoremap <leader>qd :Telescope lsp_document_diagnostics<CR>
"auto close delemiters
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>

nnoremap <leader>I <cmd>lua require('rust-tools.inlay_hints').toggle_inlay_hints()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>K <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>k <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>s <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <C-k> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <C-j> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
"inoremap <buffer> <expr><C-f> lsp#sctoll(+4)
"nnoremap <leader>i <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <leader>y <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <leader>r <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <leader>w <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"nnoremap <leader>d <cmd>lua vim.lsp.buf.definition()<CR>

"plugin configs
hi! link TSOperator GruvboxBlue
hi! link TSFuncMacro GruvboxPurple

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
"set updatetime=300
" Show diagnostic popup on cursor hold
"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
"
"lua <<EOF
"require'lspconfig'.rust_analyzer.setup{}
"EOF

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu

set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

lua require ('lualine_cfg')

lua require ('telescope_cfg')

lua require ('treesitter_cfg')

lua require ('lsp_cfg')

lua require ('cmp_cfg')
