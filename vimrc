" vim:fdm=marker

" Settings {{{
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible
set backspace=indent,eol,start

syntax on
color diokai
set number
set hlsearch

set autoindent
filetype plugin indent on

set nowrap

set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab

set nobackup

set mouse=a

" }}}
" Keyboard mappings {{{

" leader
let mapleader = ','

" paste mode
set pastetoggle=<F2>

" remove search highlights
nmap <silent> <leader>/ :nohlsearch<CR>

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

" save with sudo
cmap w!! w !sudo tee % >/dev/null

" ultisnips
let g:UltiSnipsJumpForwardTrigger = "<cr>"
let g:UltiSnipsJumpBackwardTrigger = "<s-cr>"

" }}}
" Autocmd {{{

" remove trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

" }}}
" Plugins {{{

" rooter
" let g:rooter_change_directory_for_non_project_files = 'current'

" line indentation
let g:indentLine_enabled = 0
nnoremap <F3> :LeadingSpaceToggle<CR>:IndentLinesToggle<CR>:echo "Line indent visualization toggled"<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 1

" eclim
let g:EclimCompletionMethod = 'omnifunc'

" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python'

set completeopt-=preview

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" }}}
" Status bar {{{

set noruler
set laststatus=2

" statusline highlight plugin does the coloring
highlight def StatusLineReadonly ctermbg=88
highlight def StatusLineReadonlyNC ctermbg=88
highlight def StatusLineModified ctermbg=62
highlight def StatusLineModifiedNC ctermbg=62

" Formats the statusline
set statusline=%f " file name
set statusline+=\ %y "filetype
set statusline+=\ %h "help file flag

set statusline+=\ %= " align left
set statusline+=Line:\ %l/%L\ (%p%%)\  " line X of Y [percent of file]
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format

" }}}
