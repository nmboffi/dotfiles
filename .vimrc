""""""""""""
" Vim-Plug " 
""""""""""""
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Installs a bunch of colorschemes.
Plug 'flazz/vim-colorschemes'

" IDE-Like features for vim.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

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

" Adds syntax highlighting for a number of semi-niche languages.
Plug 'justinmk/vim-syntax-extra'

" Surround things bro
Plug 'tpope/vim-surround'

" Airline
Plug 'vim-airline/vim-airline'

" New colorschemes
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'

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
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set mouse=a

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
colorscheme deus
set number

" Allow for transparency with i3 and compton.
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" C++ highlighting settings.
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""
" YCM "
"""""""
" Basic YCM Options
let g:ycm_global_ycm_extra_conf = '~/.config/.ycm_extra_conf.py'

" Intelligent GoTo finder.
nnoremap <leader>yg :YcmCompleter GoTo<CR>

" Jumps to implementation.
nnoremap <leader>yd :YcmCompleter GoToDefinition<CR>

" Make trivial modifications to the current line to fix simple bugs.
nnoremap <leader>yf :YcmCompleter FixIt<CR>

"""""""""""""""""
" gVim Settings "
"""""""""""""""""
set guioptions-=m
set guioptions-=T
set guifont=Hack\ 7
highlight Cursor guifg=white guibg=white
highlight iCursor guifg=white guibg=gray
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait1
