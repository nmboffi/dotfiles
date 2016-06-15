""" GENERAL SETTINGS
syntax enable
set nocompatible        
set backspace=2
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set mouse=a
" Improves loading of large files
set lazyredraw
set ttyfast
" fix weird colormismatch between vim and iterm2
set t_Co=256
" Better cursor
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

""" VUNDLE
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tshirtman/vim-cython'
" My plugins
Plugin 'flazz/vim-colorschemes'                     " Colors
Plugin 'Shougo/neocomplete.vim'                     " Best autocomplete I've found
Plugin 'scrooloose/nerdtree'                        " File browser
Plugin 'godlygeek/tabular'                          " Better automatic indenting
Plugin 'jpalardy/vim-slime'                         " Useful for Haskell/Lisp programming
Plugin 'luochen1990/rainbow'                        " Rainbow parentheses
Plugin 'lervag/vimtex'                              " Self-explanatory
Plugin 'jeaye/color_coded'                          " Better c-syntax highlihting
Plugin 'Raimondi/delimitMate'                       " Smart brace autoclose
Plugin 'tpope/vim-surround'                         " Allows for hotkeys to surround code with delimiters
Plugin 'sjl/vitality.vim'                           " Improves vim functionality in iterm2
Plugin 'scrooloose/nerdcommenter'                   " Quick and easy comment hotkeys
Plugin 'chriskempson/base16-vim'                    " Base16 colorschemes
Plugin 'sjl/gundo.vim'                              " Access vim's undo tree
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Darkest sierra theme
"let g:sierra_Midnight = 1
"colorscheme sierra
colorscheme base16-flat
let base16colorspace=256
set number

" Allow for transparency with i3 and compton
highlight Normal ctermbg=none
highlight NonText ctermbg=none


""" RAINBOW SETTINGS
" Enable rainbow parentheses by default
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

"""color_coded
let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'h', 'cc', 'hh', 'cpp', 'cxx']

"""vimtex
let g:vimtex_enabled = 1
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1


""" NEOCOMPLETE
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
