" vim:fdm=marker

let s:basedir = '~/.config/nvim/'

" Init {{{
if empty(glob(s:basedir . 'autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}
" Plugins {{{
call plug#begin(s:basedir . 'plugged')

Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2'
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

Plug 'ncm2/ncm2-go', { 'for': 'go' }

Plug 'itchyny/lightline.vim'
set noshowmode

Plug 'itchyny/vim-gitbranch'
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ],
    \             [ 'gitbranch' ] ],
    \   'right': [ [ 'fileencoding' ],
    \              [ 'fileformat' ] ],
    \ },
    \ 'inactive':{
    \   'left': [ [ 'filename' ] ],
    \   'right': [ [] ],
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }

Plug 'w0rp/ale'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 0

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nnoremap <F3> :NERDTreeToggle<CR>

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories = ["snips"]

let g:UltiSnipsExpandTrigger		= "<c-e>"
let g:UltiSnipsJumpForwardTrigger	= "<tab>"
let g:UltiSnipsJumpBackwardTrigger	= "<s-tab>"
let g:UltiSnipsRemoveSelectModeMappings = 0

Plug 'ncm2/ncm2-ultisnips'
noremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

Plug 'airblade/vim-gitgutter'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'

Plug 'ltlollo/diokai'

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
let g:go_fmt_autosave = 0

call plug#end()


" }}}
" Settings {{{
set hidden
set nocompatible
set backspace=indent,eol,start

color diokai
set background=dark

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

set list
set listchars=tab:>·,trail:·,extends:>,precedes:<,space:·

set updatetime=250

set splitright
set splitbelow

" }}}
" Mappings {{{

" leader
let mapleader = ','

" paste mode
set pastetoggle=<F2>

" remove search highlights
nnoremap <silent> <leader>/ :nohlsearch<CR>

" line numbering
nnoremap <silent> <leader>nr :set relativenumber!<cr>

nnoremap <silent> <leader>ns :set number<cr>:set relativenumber<cr>
nnoremap <silent> <leader>nh :set nonumber<cr>:set norelativenumber<cr>

" vimrc quick edit
nnoremap <silent> <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>vr :source $MYVIMRC<cr>:echo "config reloaded."<cr>

" only temporary...
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <pageup> <nop>
inoremap <pagedown> <nop>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <pageup> <nop>
nnoremap <pagedown> <nop>

vnoremap <pageup> <nop>
vnoremap <pagedown> <nop>

" putty numpad fuckup fix
inoremap <Esc>Oq 1
inoremap <Esc>Or 2
inoremap <Esc>Os 3
inoremap <Esc>Ot 4
inoremap <Esc>Ou 5
inoremap <Esc>Ov 6
inoremap <Esc>Ow 7
inoremap <Esc>Ox 8
inoremap <Esc>Oy 9
inoremap <Esc>Op 0
inoremap <Esc>On .
inoremap <Esc>OR *
inoremap <Esc>OQ /
inoremap <Esc>Ol +
inoremap <Esc>OS -

" insert newline in normal mode
nnoremap <C-J> i<CR><Esc>

" execute default macro in normal mode for space
nnoremap <Space> @q

" }}}
" FileTypes {{{
"    go {{{
augroup filetype_go
    au!

    autocmd BufEnter *.go
        \  call ncm2#enable_for_buffer()

    au BufWritePre *.go
        \  silent! call RemoveTrailingSpaces()
        \| silent! call GoFmtKeepFolds()

    au FileType go
        \ setlocal noexpandtab
        \| setlocal foldmethod=syntax
        \| setlocal foldlevel=0
        \| setlocal foldnestmax=1
        \| nnoremap <buffer> <silent> K :GoDoc<CR>
        \| nnoremap <buffer> <silent> gd :GoDef<CR>
        \| nnoremap <buffer> <silent> gr :GoReferrers<cr>
        \| nnoremap <buffer> <F6> :GoRename<CR>
augroup END

function! GoFmtKeepFolds()
    mkview
    GoFmt
    loadview
endfunction
"    }}}
"    vim {{{
augroup filetype_vim
    au!

    au BufWritePre *.vim
        \ silent! call RemoveTrailingSpaces()
augroup END
"    }}}
" }}}
" Functions {{{
function! RemoveTrailingSpaces()
	execute "normal! " . ':%s/\v\s+$//e' . "\<cr>"
endfunction
