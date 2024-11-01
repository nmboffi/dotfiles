""""""""""""
" Vim-Plug " 
""""""""""""
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" better syntax highlighting for python
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" File Browser
Plug 'scrooloose/nerdtree'

" Better automatic indenting
Plug 'godlygeek/tabular'

" Smart Brace Autoclose
Plug 'Raimondi/delimitMate'

" Quick and easy comment hotkeys.
Plug 'scrooloose/nerdcommenter'

" Base16 colorschemes.
Plug 'chriskempson/base16-vim'

" Access vim's undo tree.
Plug 'sjl/gundo.vim'

" Speed up folding.
Plug 'Konfekt/fastfold'

" Improved syntax highlighting for c-family of languages.
Plug 'octol/vim-cpp-enhanced-highlight'

" Start screen for vim.
Plug 'mhinz/vim-startify'

" Sensible default settings for vim.
Plug 'tpope/vim-sensible'

" Surround things bro
Plug 'tpope/vim-surround'

" Airline
Plug 'vim-airline/vim-airline'

" Show indentations, useful for python.
Plug 'Yggdroot/indentLine'

" syntax highlighting for vim
Plug 'JuliaEditorSupport/julia-vim'

" New colorschemes
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Despacio'
Plug 'godlygeek/csapprox'

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""
" General Settings "
""""""""""""""""""""
" Really simple stuff.
syntax enable
set nocompatible        
set backspace=2
set tabstop=2 
set softtabstop=2 
set expandtab 
set shiftwidth=2 
set smarttab
set mouse=a
set cc=90

" Improves loading of large files.
set lazyredraw
set ttyfast

" Remap the leader key.
let mapleader="\\"
set timeoutlen=250

" Colorscheme.
let base16colorspace=256
set background=dark
set t_Co=256
"colorscheme base16-ocean
"colorscheme base16-gruvbox-light-soft
colorscheme base16-mocha
set number

" C++ highlighting settings.
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Clipboard
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>
  
" Fix semshi syntax highlighting override colorscheme.
"let g:semshi#simplify_markup = v:false

" Disable vim conversion of latex code.
let g:tex_conceal = ""

"""""""""""""""""
" gVim Settings "
"""""""""""""""""
" set guioptions-=m
" set guioptions-=T
" set guifont=Fira\ Code\ 14
highlight Cursor guifg=white guibg=white
highlight iCursor guifg=white guibg=gray
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait1
