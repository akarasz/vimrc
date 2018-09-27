set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" autocompletion
setlocal omnifunc=csscomplete#CompleteCSS noci
let g:completor_css_omni_trigger = '^\s+([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
