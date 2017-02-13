" vim:fdm=marker

" Settings {{{
execute pathogen#infect()

set nocompatible
set backspace=indent,eol,start

syntax on
color diokai
set number
set hlsearch

set autoindent
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab

set nobackup

" }}}
" Keyboard mappings {{{

" switch between panes
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" switch between tabs
nnoremap H gT
nnoremap L gt

" }}}
" Plugins {{{

" rooter
let g:rooter_change_directory_for_non_project_files = 'current'

" line indentation
let g:indentLine_enabled = 0
nnoremap <F3> :LeadingSpaceToggle<CR>:IndentLinesToggle<CR>:echo "Line indent visualization toggled"<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" }}}
