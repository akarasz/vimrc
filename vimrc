execute pathogen#infect()

set nocompatible
set backspace=indent,eol,start

syntax on
set hlsearch

set autoindent
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab

set nobackup

" line indentation
let g:indentLine_enabled = 0
nnoremap <F3> :LeadingSpaceToggle<CR>:IndentLinesToggle<CR>:echo "Line indent visualization toggled"<CR>

" switch between tabs
nnoremap H gT
nnoremap L gt

" nerdtree
map <C-n> :NERDTreeToggle<CR>
