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
let g:ale_open_list = 0

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 0

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nnoremap <F3> :NERDTreeToggle<CR>

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_current_file = 1

Plug 'airblade/vim-gitgutter'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'

Plug 'ltlollo/diokai'

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
let g:go_fmt_autosave = 0

Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2'
set completeopt=noinsert,menuone,noselect
set shortmess+=c

Plug 'Shougo/neosnippet.vim'
let g:neosnippet#disable_runtime_snippets = {
    \ '_': 1,
    \ }

inoremap <expr> <cr> HandleCrI()
inoremap <expr> <tab> HandleTabI()
imap <expr> <s-tab> HandleSTabI()
smap <expr> <tab> HandleTabS()

function! HandleCrI()
    if pumvisible()
        if empty(v:completed_item)
            return "\<c-e>"
        endif
    endif

    return ncm2_neosnippet#expand_or("\<cr>", 'n')
endfunction

function! HandleTabI()
    if pumvisible()
        return "\<c-n>"
    else
        if neosnippet#expandable_or_jumpable()
            return "\<Plug>(neosnippet_expand_or_jump)"
        else
            return "\<tab>"
        endif
    endif
endfunction

function! HandleSTabI()
    if pumvisible()
        return "\<c-p>"
    else
        return "\<s-tab>"
    endif
endfunction

function! HandleTabS()
    if neosnippet#expandable_or_jumpable()
        return "\<Plug>(neosnippet_expand_or_jump)"
    else
        return "\<tab>"
    endif
endfunction

Plug 'ncm2/ncm2-neosnippet'

Plug 'ncm2/ncm2-go', { 'for': 'go' }

Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'

Plug 'natebosch/vim-lsc'
set shortmess-=F
let g:lsc_server_commands = {
    \ 'java': '/home/andris/tools/java-language-server/dist/mac/bin/launcher --quiet'
\ }
let g:lsc_auto_map = v:true

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

set colorcolumn=100

set smarttab
set expandtab

set nobackup

set mouse=a

set list
set listchars=tab:>·,trail:·,extends:>,precedes:<,space:·

set updatetime=250

set splitright
set splitbelow

set scrolloff=5

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

" toggle list
nnoremap <leader>l :set list!<cr>

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
inoremap <esc>Oq 1
inoremap <esc>Or 2
inoremap <esc>Os 3
inoremap <esc>Ot 4
inoremap <esc>Ou 5
inoremap <esc>Ov 6
inoremap <esc>Ow 7
inoremap <esc>Ox 8
inoremap <esc>Oy 9
inoremap <esc>Op 0
inoremap <esc>On .
inoremap <esc>OR *
inoremap <esc>OQ /
inoremap <esc>Ol +
inoremap <esc>OS -

" insert newline in normal mode
nnoremap <c-j> i<CR><Esc>

" execute default macro in normal mode for space
nnoremap <space> @q

" switch to previous buffer
nnoremap <silent> <tab><tab> :b#<cr>

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
        \  setlocal noexpandtab
        \| setlocal foldmethod=syntax
        \| setlocal foldlevel=0
        \| setlocal foldnestmax=1
        \| nnoremap <buffer> <silent> K :GoDoc<CR>
        \| nnoremap <buffer> <silent> gd :GoDef<CR>
        \| nnoremap <buffer> <silent> gr :GoReferrers<cr>
        \| nnoremap <buffer> <F4> :GoRename<CR>
augroup END

function! GoFmtKeepFolds()
    mkview
    GoFmt
    loadview
endfunction
"    }}}
"    java {{{
augroup filetype_java
    au!

    autocmd BufEnter *.java
        \  call ncm2#enable_for_buffer()
augroup END
"    }}}
"    markdown {{{
augroup filetype_md
    au!

    au BufWritePre *.md
        \  silent! call RemoveTrailingSpaces()

    au FileType markdown
        \  setlocal colorcolumn=80
augroup END
"    }}}
"    vim {{{
augroup filetype_vim
    au!

    autocmd BufEnter *.vim
        \  call ncm2#enable_for_buffer()

    au BufWritePre *.vim
        \ silent! call RemoveTrailingSpaces()
augroup END
"    }}}
" }}}
" Functions {{{
function! RemoveTrailingSpaces()
	execute "normal! " . ':%s/\v\s+$//e' . "\<cr>"
endfunction
