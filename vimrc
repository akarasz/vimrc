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

set mouse=a

" }}}
" Keyboard mappings {{{

" switch between buffers
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

" putty numpad fuckup fix
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OR *
imap <Esc>OQ /
imap <Esc>Ol +
imap <Esc>OS -

" insert newline in normal mode
nnoremap <C-J> i<CR><Esc>
" }}}
" Plugins {{{

" rooter
let g:rooter_change_directory_for_non_project_files = 'current'

" line indentation
let g:indentLine_enabled = 0
nnoremap <F3> :LeadingSpaceToggle<CR>:IndentLinesToggle<CR>:echo "Line indent visualization toggled"<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" eclim
let g:EclimCompletionMethod = 'omnifunc'

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" YouCompleteMe
set completeopt-=preview

" }}}
