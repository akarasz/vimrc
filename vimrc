" vim:fdm=marker

" Settings {{{
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible
set backspace=indent,eol,start

syntax on
color diokai
set cursorline
set number
set relativenumber
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

set listchars=tab:>·,trail:·,extends:>,precedes:<,space:·
set list

set updatetime=250

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

" execute default macro in normal mode for space
nnoremap <Space> @q

" }}}
" Autocmd {{{

" remove trailing white spaces on save
au BufWritePre * %s/\s\+$//e

" toggle views
nmap <silent> <leader>sn :set relativenumber!<CR>:set number!<CR>
nmap <silent> <leader>sl :set cursorline!<CR>

" }}}
" Plugins {{{

" rooter
" let g:rooter_change_directory_for_non_project_files = 'current'

" completer
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
let g:completor_debug = 0
let g:completor_complete_options = "menuone,select,preview"

" ctrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" skeletons
let skeletons#autoRegister = 1

" supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" utlisnips
let g:UltiSnipsSnippetDirectories = ["snips"]
let g:UltiSnipsJumpForwardTrigger = "<cr>"
let g:UltiSnipsJumpBackwardTrigger = "<s-cr>"

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
