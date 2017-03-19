" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Run :PluginInstall to install

Plugin 'vim-airline/vim-airline'

" Vundle
call vundle#end()            " required
filetype plugin indent on    " required

" vim-airline config
set laststatus=2
"let g:airline_section_y=airline#section#create_right(['ffenc'])
let g:airline_section_z=airline#section#create_right(['%3l:%-2v'])
"let g:airline_powerline_fonts = 1

" Wrap properly at line end
set whichwrap=b,s,<,>,[,],h,l
set backspace=eol,start,indent

" Highlight search results
set hlsearch

" Show matching parentheses
set showmatch
set mat=2

" Color scheme
syntax enable
colorscheme monokai
set background=dark

highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black

set number
" Tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

set ai " Auto indent
set si " Smart indent

imap jk <Esc>

" Need vim-gtk to work with system clipboard
vnoremap <C-c> "+y
set mouse=a

" Split navigation

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

